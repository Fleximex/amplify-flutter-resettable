//
// Copyright Amazon.com, Inc. or its affiliates. All Rights Reserved.
// SPDX-License-Identifier: Apache-2.0
// Autogenerated from Pigeon (v11.0.1), do not edit directly.
// See also: https://pub.dev/packages/pigeon
// ignore_for_file: public_member_api_docs, non_constant_identifier_names, avoid_as, unused_import, unnecessary_parenthesis, prefer_null_aware_operators, omit_local_variable_types, unused_shown_name, unnecessary_import

import 'dart:async';
import 'dart:typed_data' show Float64List, Int32List, Int64List, Uint8List;

import 'package:flutter/foundation.dart' show ReadBuffer, WriteBuffer;
import 'package:flutter/services.dart';

class NativeAuthSession {
  NativeAuthSession({
    required this.isSignedIn,
    this.userSub,
    this.userPoolTokens,
    this.identityId,
    this.awsCredentials,
  });

  bool isSignedIn;

  String? userSub;

  NativeUserPoolTokens? userPoolTokens;

  String? identityId;

  NativeAWSCredentials? awsCredentials;

  Object encode() {
    return <Object?>[
      isSignedIn,
      userSub,
      userPoolTokens?.encode(),
      identityId,
      awsCredentials?.encode(),
    ];
  }

  static NativeAuthSession decode(Object result) {
    result as List<Object?>;
    return NativeAuthSession(
      isSignedIn: result[0]! as bool,
      userSub: result[1] as String?,
      userPoolTokens: result[2] != null
          ? NativeUserPoolTokens.decode(result[2]! as List<Object?>)
          : null,
      identityId: result[3] as String?,
      awsCredentials: result[4] != null
          ? NativeAWSCredentials.decode(result[4]! as List<Object?>)
          : null,
    );
  }
}

class NativeAuthUser {
  NativeAuthUser({
    required this.userId,
    required this.username,
  });

  String userId;

  String username;

  Object encode() {
    return <Object?>[
      userId,
      username,
    ];
  }

  static NativeAuthUser decode(Object result) {
    result as List<Object?>;
    return NativeAuthUser(
      userId: result[0]! as String,
      username: result[1]! as String,
    );
  }
}

class NativeUserPoolTokens {
  NativeUserPoolTokens({
    required this.accessToken,
    required this.refreshToken,
    required this.idToken,
  });

  String accessToken;

  String refreshToken;

  String idToken;

  Object encode() {
    return <Object?>[
      accessToken,
      refreshToken,
      idToken,
    ];
  }

  static NativeUserPoolTokens decode(Object result) {
    result as List<Object?>;
    return NativeUserPoolTokens(
      accessToken: result[0]! as String,
      refreshToken: result[1]! as String,
      idToken: result[2]! as String,
    );
  }
}

class NativeAWSCredentials {
  NativeAWSCredentials({
    required this.accessKeyId,
    required this.secretAccessKey,
    this.sessionToken,
    this.expirationIso8601Utc,
  });

  String accessKeyId;

  String secretAccessKey;

  String? sessionToken;

  String? expirationIso8601Utc;

  Object encode() {
    return <Object?>[
      accessKeyId,
      secretAccessKey,
      sessionToken,
      expirationIso8601Utc,
    ];
  }

  static NativeAWSCredentials decode(Object result) {
    result as List<Object?>;
    return NativeAWSCredentials(
      accessKeyId: result[0]! as String,
      secretAccessKey: result[1]! as String,
      sessionToken: result[2] as String?,
      expirationIso8601Utc: result[3] as String?,
    );
  }
}

class NativeGraphQLResponse {
  NativeGraphQLResponse({
    this.payloadJson,
    this.errorsJson,
  });

  String? payloadJson;

  String? errorsJson;

  Object encode() {
    return <Object?>[
      payloadJson,
      errorsJson,
    ];
  }

  static NativeGraphQLResponse decode(Object result) {
    result as List<Object?>;
    return NativeGraphQLResponse(
      payloadJson: result[0] as String?,
      errorsJson: result[1] as String?,
    );
  }
}

class NativeGraphQLSubscriptionResponse {
  NativeGraphQLSubscriptionResponse({
    this.subscriptionId,
    this.payloadJson,
    this.type,
  });

  String? subscriptionId;

  String? payloadJson;

  String? type;

  Object encode() {
    return <Object?>[
      subscriptionId,
      payloadJson,
      type,
    ];
  }

  static NativeGraphQLSubscriptionResponse decode(Object result) {
    result as List<Object?>;
    return NativeGraphQLSubscriptionResponse(
      subscriptionId: result[0] as String?,
      payloadJson: result[1] as String?,
      type: result[2] as String?,
    );
  }
}

class NativeGraphQLRequest {
  NativeGraphQLRequest({
    this.apiName,
    this.document,
    this.variablesJson,
    this.responseType,
    this.decodePath,
    this.options,
  });

  String? apiName;

  String? document;

  String? variablesJson;

  String? responseType;

  String? decodePath;

  Map<String?, String?>? options;

  Object encode() {
    return <Object?>[
      apiName,
      document,
      variablesJson,
      responseType,
      decodePath,
      options,
    ];
  }

  static NativeGraphQLRequest decode(Object result) {
    result as List<Object?>;
    return NativeGraphQLRequest(
      apiName: result[0] as String?,
      document: result[1] as String?,
      variablesJson: result[2] as String?,
      responseType: result[3] as String?,
      decodePath: result[4] as String?,
      options: (result[5] as Map<Object?, Object?>?)?.cast<String?, String?>(),
    );
  }
}

class _NativeAuthPluginCodec extends StandardMessageCodec {
  const _NativeAuthPluginCodec();
  @override
  void writeValue(WriteBuffer buffer, Object? value) {
    if (value is NativeAWSCredentials) {
      buffer.putUint8(128);
      writeValue(buffer, value.encode());
    } else if (value is NativeAuthSession) {
      buffer.putUint8(129);
      writeValue(buffer, value.encode());
    } else if (value is NativeUserPoolTokens) {
      buffer.putUint8(130);
      writeValue(buffer, value.encode());
    } else {
      super.writeValue(buffer, value);
    }
  }

  @override
  Object? readValueOfType(int type, ReadBuffer buffer) {
    switch (type) {
      case 128:
        return NativeAWSCredentials.decode(readValue(buffer)!);
      case 129:
        return NativeAuthSession.decode(readValue(buffer)!);
      case 130:
        return NativeUserPoolTokens.decode(readValue(buffer)!);
      default:
        return super.readValueOfType(type, buffer);
    }
  }
}

abstract class NativeAuthPlugin {
  static const MessageCodec<Object?> codec = _NativeAuthPluginCodec();

  Future<NativeAuthSession> fetchAuthSession();

  static void setup(NativeAuthPlugin? api, {BinaryMessenger? binaryMessenger}) {
    {
      final BasicMessageChannel<Object?> channel = BasicMessageChannel<Object?>(
          'dev.flutter.pigeon.amplify_datastore.NativeAuthPlugin.fetchAuthSession',
          codec,
          binaryMessenger: binaryMessenger);
      if (api == null) {
        channel.setMessageHandler(null);
      } else {
        channel.setMessageHandler((Object? message) async {
          // ignore message
          final NativeAuthSession output = await api.fetchAuthSession();
          return output;
        });
      }
    }
  }
}

class _NativeApiPluginCodec extends StandardMessageCodec {
  const _NativeApiPluginCodec();
  @override
  void writeValue(WriteBuffer buffer, Object? value) {
    if (value is NativeGraphQLRequest) {
      buffer.putUint8(128);
      writeValue(buffer, value.encode());
    } else if (value is NativeGraphQLResponse) {
      buffer.putUint8(129);
      writeValue(buffer, value.encode());
    } else if (value is NativeGraphQLSubscriptionResponse) {
      buffer.putUint8(130);
      writeValue(buffer, value.encode());
    } else {
      super.writeValue(buffer, value);
    }
  }

  @override
  Object? readValueOfType(int type, ReadBuffer buffer) {
    switch (type) {
      case 128:
        return NativeGraphQLRequest.decode(readValue(buffer)!);
      case 129:
        return NativeGraphQLResponse.decode(readValue(buffer)!);
      case 130:
        return NativeGraphQLSubscriptionResponse.decode(readValue(buffer)!);
      default:
        return super.readValueOfType(type, buffer);
    }
  }
}

abstract class NativeApiPlugin {
  static const MessageCodec<Object?> codec = _NativeApiPluginCodec();

  Future<String?> getLatestAuthToken(String providerName);

  Future<NativeGraphQLResponse> mutate(NativeGraphQLRequest request);

  Future<NativeGraphQLResponse> query(NativeGraphQLRequest request);

  Future<NativeGraphQLSubscriptionResponse> subscribe(
      NativeGraphQLRequest request);

  static void setup(NativeApiPlugin? api, {BinaryMessenger? binaryMessenger}) {
    {
      final BasicMessageChannel<Object?> channel = BasicMessageChannel<Object?>(
          'dev.flutter.pigeon.amplify_datastore.NativeApiPlugin.getLatestAuthToken',
          codec,
          binaryMessenger: binaryMessenger);
      if (api == null) {
        channel.setMessageHandler(null);
      } else {
        channel.setMessageHandler((Object? message) async {
          assert(message != null,
              'Argument for dev.flutter.pigeon.amplify_datastore.NativeApiPlugin.getLatestAuthToken was null.');
          final List<Object?> args = (message as List<Object?>?)!;
          final String? arg_providerName = (args[0] as String?);
          assert(arg_providerName != null,
              'Argument for dev.flutter.pigeon.amplify_datastore.NativeApiPlugin.getLatestAuthToken was null, expected non-null String.');
          final String? output =
              await api.getLatestAuthToken(arg_providerName!);
          return output;
        });
      }
    }
    {
      final BasicMessageChannel<Object?> channel = BasicMessageChannel<Object?>(
          'dev.flutter.pigeon.amplify_datastore.NativeApiPlugin.mutate', codec,
          binaryMessenger: binaryMessenger);
      if (api == null) {
        channel.setMessageHandler(null);
      } else {
        channel.setMessageHandler((Object? message) async {
          assert(message != null,
              'Argument for dev.flutter.pigeon.amplify_datastore.NativeApiPlugin.mutate was null.');
          final List<Object?> args = (message as List<Object?>?)!;
          final NativeGraphQLRequest? arg_request =
              (args[0] as NativeGraphQLRequest?);
          assert(arg_request != null,
              'Argument for dev.flutter.pigeon.amplify_datastore.NativeApiPlugin.mutate was null, expected non-null NativeGraphQLRequest.');
          final NativeGraphQLResponse output = await api.mutate(arg_request!);
          return output;
        });
      }
    }
    {
      final BasicMessageChannel<Object?> channel = BasicMessageChannel<Object?>(
          'dev.flutter.pigeon.amplify_datastore.NativeApiPlugin.query', codec,
          binaryMessenger: binaryMessenger);
      if (api == null) {
        channel.setMessageHandler(null);
      } else {
        channel.setMessageHandler((Object? message) async {
          assert(message != null,
              'Argument for dev.flutter.pigeon.amplify_datastore.NativeApiPlugin.query was null.');
          final List<Object?> args = (message as List<Object?>?)!;
          final NativeGraphQLRequest? arg_request =
              (args[0] as NativeGraphQLRequest?);
          assert(arg_request != null,
              'Argument for dev.flutter.pigeon.amplify_datastore.NativeApiPlugin.query was null, expected non-null NativeGraphQLRequest.');
          final NativeGraphQLResponse output = await api.query(arg_request!);
          return output;
        });
      }
    }
    {
      final BasicMessageChannel<Object?> channel = BasicMessageChannel<Object?>(
          'dev.flutter.pigeon.amplify_datastore.NativeApiPlugin.subscribe',
          codec,
          binaryMessenger: binaryMessenger);
      if (api == null) {
        channel.setMessageHandler(null);
      } else {
        channel.setMessageHandler((Object? message) async {
          assert(message != null,
              'Argument for dev.flutter.pigeon.amplify_datastore.NativeApiPlugin.subscribe was null.');
          final List<Object?> args = (message as List<Object?>?)!;
          final NativeGraphQLRequest? arg_request =
              (args[0] as NativeGraphQLRequest?);
          assert(arg_request != null,
              'Argument for dev.flutter.pigeon.amplify_datastore.NativeApiPlugin.subscribe was null, expected non-null NativeGraphQLRequest.');
          final NativeGraphQLSubscriptionResponse output =
              await api.subscribe(arg_request!);
          return output;
        });
      }
    }
  }
}

class NativeAmplifyBridge {
  /// Constructor for [NativeAmplifyBridge].  The [binaryMessenger] named argument is
  /// available for dependency injection.  If it is left null, the default
  /// BinaryMessenger will be used which routes to the host platform.
  NativeAmplifyBridge({BinaryMessenger? binaryMessenger})
      : _binaryMessenger = binaryMessenger;
  final BinaryMessenger? _binaryMessenger;

  static const MessageCodec<Object?> codec = StandardMessageCodec();

  Future<void> configure(String arg_version, String arg_config) async {
    final BasicMessageChannel<Object?> channel = BasicMessageChannel<Object?>(
        'dev.flutter.pigeon.amplify_datastore.NativeAmplifyBridge.configure',
        codec,
        binaryMessenger: _binaryMessenger);
    final List<Object?>? replyList = await channel
        .send(<Object?>[arg_version, arg_config]) as List<Object?>?;
    if (replyList == null) {
      throw PlatformException(
        code: 'channel-error',
        message: 'Unable to establish connection on channel.',
      );
    } else if (replyList.length > 1) {
      throw PlatformException(
        code: replyList[0]! as String,
        message: replyList[1] as String?,
        details: replyList[2],
      );
    } else {
      return;
    }
  }
}

class _NativeAuthBridgeCodec extends StandardMessageCodec {
  const _NativeAuthBridgeCodec();
  @override
  void writeValue(WriteBuffer buffer, Object? value) {
    if (value is NativeAuthUser) {
      buffer.putUint8(128);
      writeValue(buffer, value.encode());
    } else {
      super.writeValue(buffer, value);
    }
  }

  @override
  Object? readValueOfType(int type, ReadBuffer buffer) {
    switch (type) {
      case 128:
        return NativeAuthUser.decode(readValue(buffer)!);
      default:
        return super.readValueOfType(type, buffer);
    }
  }
}

class NativeAuthBridge {
  /// Constructor for [NativeAuthBridge].  The [binaryMessenger] named argument is
  /// available for dependency injection.  If it is left null, the default
  /// BinaryMessenger will be used which routes to the host platform.
  NativeAuthBridge({BinaryMessenger? binaryMessenger})
      : _binaryMessenger = binaryMessenger;
  final BinaryMessenger? _binaryMessenger;

  static const MessageCodec<Object?> codec = _NativeAuthBridgeCodec();

  Future<void> addAuthPlugin() async {
    final BasicMessageChannel<Object?> channel = BasicMessageChannel<Object?>(
        'dev.flutter.pigeon.amplify_datastore.NativeAuthBridge.addAuthPlugin',
        codec,
        binaryMessenger: _binaryMessenger);
    final List<Object?>? replyList = await channel.send(null) as List<Object?>?;
    if (replyList == null) {
      throw PlatformException(
        code: 'channel-error',
        message: 'Unable to establish connection on channel.',
      );
    } else if (replyList.length > 1) {
      throw PlatformException(
        code: replyList[0]! as String,
        message: replyList[1] as String?,
        details: replyList[2],
      );
    } else {
      return;
    }
  }

  Future<void> updateCurrentUser(NativeAuthUser? arg_user) async {
    final BasicMessageChannel<Object?> channel = BasicMessageChannel<Object?>(
        'dev.flutter.pigeon.amplify_datastore.NativeAuthBridge.updateCurrentUser',
        codec,
        binaryMessenger: _binaryMessenger);
    final List<Object?>? replyList =
        await channel.send(<Object?>[arg_user]) as List<Object?>?;
    if (replyList == null) {
      throw PlatformException(
        code: 'channel-error',
        message: 'Unable to establish connection on channel.',
      );
    } else if (replyList.length > 1) {
      throw PlatformException(
        code: replyList[0]! as String,
        message: replyList[1] as String?,
        details: replyList[2],
      );
    } else {
      return;
    }
  }
}

class _NativeApiBridgeCodec extends StandardMessageCodec {
  const _NativeApiBridgeCodec();
  @override
  void writeValue(WriteBuffer buffer, Object? value) {
    if (value is NativeGraphQLSubscriptionResponse) {
      buffer.putUint8(128);
      writeValue(buffer, value.encode());
    } else {
      super.writeValue(buffer, value);
    }
  }

  @override
  Object? readValueOfType(int type, ReadBuffer buffer) {
    switch (type) {
      case 128:
        return NativeGraphQLSubscriptionResponse.decode(readValue(buffer)!);
      default:
        return super.readValueOfType(type, buffer);
    }
  }
}

class NativeApiBridge {
  /// Constructor for [NativeApiBridge].  The [binaryMessenger] named argument is
  /// available for dependency injection.  If it is left null, the default
  /// BinaryMessenger will be used which routes to the host platform.
  NativeApiBridge({BinaryMessenger? binaryMessenger})
      : _binaryMessenger = binaryMessenger;
  final BinaryMessenger? _binaryMessenger;

  static const MessageCodec<Object?> codec = _NativeApiBridgeCodec();

  Future<void> addApiPlugin(List<String?> arg_authProvidersList) async {
    final BasicMessageChannel<Object?> channel = BasicMessageChannel<Object?>(
        'dev.flutter.pigeon.amplify_datastore.NativeApiBridge.addApiPlugin',
        codec,
        binaryMessenger: _binaryMessenger);
    final List<Object?>? replyList =
        await channel.send(<Object?>[arg_authProvidersList]) as List<Object?>?;
    if (replyList == null) {
      throw PlatformException(
        code: 'channel-error',
        message: 'Unable to establish connection on channel.',
      );
    } else if (replyList.length > 1) {
      throw PlatformException(
        code: replyList[0]! as String,
        message: replyList[1] as String?,
        details: replyList[2],
      );
    } else {
      return;
    }
  }

  Future<void> sendSubscriptionEvent(
      NativeGraphQLSubscriptionResponse arg_event) async {
    final BasicMessageChannel<Object?> channel = BasicMessageChannel<Object?>(
        'dev.flutter.pigeon.amplify_datastore.NativeApiBridge.sendSubscriptionEvent',
        codec,
        binaryMessenger: _binaryMessenger);
    final List<Object?>? replyList =
        await channel.send(<Object?>[arg_event]) as List<Object?>?;
    if (replyList == null) {
      throw PlatformException(
        code: 'channel-error',
        message: 'Unable to establish connection on channel.',
      );
    } else if (replyList.length > 1) {
      throw PlatformException(
        code: replyList[0]! as String,
        message: replyList[1] as String?,
        details: replyList[2],
      );
    } else {
      return;
    }
  }
}
