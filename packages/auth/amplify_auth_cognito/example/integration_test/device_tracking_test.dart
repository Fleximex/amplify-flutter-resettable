// Copyright Amazon.com, Inc. or its affiliates. All Rights Reserved.
// SPDX-License-Identifier: Apache-2.0

import 'package:amplify_api/amplify_api.dart';
import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_auth_cognito_dart/src/credentials/device_metadata_repository.dart';
import 'package:amplify_auth_cognito_dart/src/sdk/cognito_identity_provider.dart';
import 'package:amplify_auth_cognito_example/amplifyconfiguration.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:amplify_test/amplify_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

import 'utils/mock_data.dart';
import 'utils/setup_utils.dart';
import 'utils/test_utils.dart';

enum DeviceState { untracked, tracked, remembered }

DeviceMetadataRepository get deviceRepo =>
    Amplify.Auth.getPlugin(AmplifyAuthCognito.pluginKey)
        // ignore: invalid_use_of_protected_member
        .stateMachine
        .getOrCreate<DeviceMetadataRepository>();

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  AmplifyLogger().logLevel = LogLevel.debug;

  group('Device Tracking', () {
    String? username;
    String? password;

    Future<DeviceState> getDeviceState() async {
      final secrets = await deviceRepo.get(username!);
      if (secrets == null) {
        return DeviceState.untracked;
      }
      return secrets.deviceStatus == DeviceRememberedStatusType.remembered
          ? DeviceState.remembered
          : DeviceState.tracked;
    }

    Future<String?> getDeviceKey() async {
      final secrets = await deviceRepo.get(username!);
      return secrets?.deviceKey;
    }

    Future<void> signIn({
      bool enableMfa = false,
    }) async {
      await signOutUser();

      if (username == null && password == null) {
        username = generateUsername();
        password = generatePassword();

        await adminCreateUser(
          username!,
          password!,
          autoConfirm: true,
          verifyAttributes: true,
          enableMfa: enableMfa,
        );
        addTearDown(() async {
          await deleteUser(username!);
          username = null;
          password = null;
        });
      }

      if (enableMfa) {
        final otpResult = await getOtpCode(username!);
        final signInRes = await Amplify.Auth.signIn(
          username: username!,
          password: password,
        );
        if (signInRes.nextStep.signInStep ==
            AuthSignInStep.confirmSignInWithSmsMfaCode) {
          final confirmSignInRes = await Amplify.Auth.confirmSignIn(
            confirmationValue: await otpResult.code,
          );
          expect(confirmSignInRes.isSignedIn, isTrue);
        } else {
          expect(signInRes.isSignedIn, isTrue);
        }
      } else {
        final res = await Amplify.Auth.signIn(
          username: username!,
          password: password,
        );
        expect(res.isSignedIn, isTrue);
      }
    }

    group('Opt-In', () {
      setUpAll(() async {
        await configureAuth(
          config: amplifyEnvironments['device-tracking-opt-in'],
        );
      });

      setUp(signIn);

      asyncTest('device is not automatically remembered', (_) async {
        expect(await getDeviceState(), DeviceState.tracked);
      });

      asyncTest('rememberDevice starts tracking', (_) async {
        expect(await getDeviceState(), DeviceState.tracked);
        await Amplify.Auth.rememberDevice();
        expect(await getDeviceState(), DeviceState.remembered);
      });

      asyncTest('forgetDevice stops tracking', (_) async {
        expect(await getDeviceState(), DeviceState.tracked);
        await Amplify.Auth.rememberDevice();
        expect(await getDeviceState(), DeviceState.remembered);
        await Amplify.Auth.forgetDevice();
        expect(await getDeviceState(), DeviceState.untracked);
      });

      asyncTest('fetchDevices lists remembered devices', (_) async {
        expect(await getDeviceState(), DeviceState.tracked);
        expect(await Amplify.Auth.fetchDevices(), isEmpty);
        await Amplify.Auth.rememberDevice();
        expect(await Amplify.Auth.fetchDevices(), isNotEmpty);
      });

      asyncTest('multiple logins use the same device key', (_) async {
        final deviceKey = await getDeviceKey();
        expect(deviceKey, isNotNull);
        await signOutUser();
        await signIn();
        expect(await getDeviceKey(), deviceKey);
      });

      asyncTest('can login when device is removed in Cognito', (_) async {
        final deviceKey = await getDeviceKey();
        expect(deviceKey, isNotNull);
        await signOutUser();
        await deleteDevice(username!, deviceKey!);
        await expectLater(signIn(), completes);
        final newDeviceKey = await getDeviceKey();
        expect(newDeviceKey, isNotNull);
        expect(newDeviceKey, isNot(deviceKey));
      });
    });

    group(
      'Opt-In (MFA)',
      () {
        setUpAll(() async {
          await configureAuth(
            additionalPlugins: [AmplifyAPI()],
            config: amplifyEnvironments['device-tracking-opt-in'],
          );
        });

        setUp(() => signIn(enableMfa: true));

        asyncTest('cannot bypass MFA when device is not remembered', (_) async {
          await signOutUser();

          final res = await Amplify.Auth.signIn(
            username: username!,
            password: password,
          );
          expect(
            res.nextStep.signInStep,
            AuthSignInStep.confirmSignInWithSmsMfaCode,
            reason: 'Subsequent sign-in attempts should require MFA',
          );
        });

        asyncTest('can bypass MFA when device is remembered', (_) async {
          await Amplify.Auth.rememberDevice();
          await signOutUser();

          final res = await Amplify.Auth.signIn(
            username: username!,
            password: password,
          );
          expect(
            res.isSignedIn,
            isTrue,
            reason: 'Subsequent sign-in attempts should not require MFA',
          );
        });

        asyncTest('can login when device is removed in Cognito', (_) async {
          final deviceKey = await getDeviceKey();
          expect(deviceKey, isNotNull);
          await signOutUser();
          await deleteDevice(username!, deviceKey!);
          await expectLater(signIn(enableMfa: true), completes);
          final newDeviceKey = await getDeviceKey();
          expect(newDeviceKey, isNotNull);
          expect(newDeviceKey, isNot(deviceKey));
        });
      },
    );

    group('Always', () {
      setUpAll(() async {
        await configureAuth(
          config: amplifyEnvironments['device-tracking-always'],
        );
      });

      setUp(signIn);

      asyncTest('device is automatically remembered', (_) async {
        expect(await getDeviceState(), DeviceState.remembered);
      });

      asyncTest('rememberDevice is a no-op when already tracking', (_) async {
        await expectLater(Amplify.Auth.rememberDevice(), completes);
      });

      asyncTest('forgetDevice stops tracking', (_) async {
        expect(await getDeviceState(), DeviceState.remembered);
        await Amplify.Auth.forgetDevice();
        expect(await getDeviceState(), DeviceState.untracked);
      });

      asyncTest('fetchDevices lists remembered devices', (_) async {
        expect(await Amplify.Auth.fetchDevices(), hasLength(1));
      });

      asyncTest('multiple logins use the same device key', (_) async {
        final deviceKey = await getDeviceKey();
        expect(deviceKey, isNotNull);
        await signOutUser();
        await signIn();
        expect(await getDeviceKey(), deviceKey);
      });

      asyncTest('can login when device is removed in Cognito', (_) async {
        final deviceKey = await getDeviceKey();
        expect(deviceKey, isNotNull);
        await signOutUser();
        await deleteDevice(username!, deviceKey!);
        await expectLater(signIn(), completes);
        final newDeviceKey = await getDeviceKey();
        expect(newDeviceKey, isNotNull);
        expect(newDeviceKey, isNot(deviceKey));
      });
    });

    group('Always (MFA)', () {
      setUpAll(() async {
        await configureAuth(
          additionalPlugins: [AmplifyAPI()],
          config: amplifyEnvironments['device-tracking-always'],
        );
      });

      setUp(() => signIn(enableMfa: true));

      asyncTest('can bypass MFA when device is always remembered', (_) async {
        await signOutUser();

        final res = await Amplify.Auth.signIn(
          username: username!,
          password: password,
        );
        expect(
          res.isSignedIn,
          isTrue,
          reason: 'Subsequent sign-in attempts should not require MFA',
        );
      });

      asyncTest('can login when device is removed in Cognito', (_) async {
        final deviceKey = await getDeviceKey();
        expect(deviceKey, isNotNull);
        await signOutUser();
        await deleteDevice(username!, deviceKey!);
        await expectLater(signIn(enableMfa: true), completes);
        final newDeviceKey = await getDeviceKey();
        expect(newDeviceKey, isNotNull);
        expect(newDeviceKey, isNot(deviceKey));
      });
    });
  });
}
