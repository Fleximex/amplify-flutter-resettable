// Copyright Amazon.com, Inc. or its affiliates. All Rights Reserved.
// SPDX-License-Identifier: Apache-2.0

import 'dart:collection';
import 'dart:convert';
import 'dart:io';

import 'package:aft/aft.dart';
import 'package:aft/src/repo.dart';
import 'package:args/command_runner.dart';
import 'package:aws_common/aws_common.dart';
import 'package:checked_yaml/checked_yaml.dart';
import 'package:git/git.dart' as git;
import 'package:http/http.dart' as http;
import 'package:meta/meta.dart';
import 'package:path/path.dart' as p;
import 'package:pub/pub.dart';
import 'package:pub_semver/pub_semver.dart';

/// Base class for all commands in this package providing common functionality.
abstract class AmplifyCommand extends Command<void>
    implements AWSLoggerPlugin, Closeable {
  AmplifyCommand() {
    init();
  }

  /// Initializer which runs when this command is instantiated.
  ///
  /// This can be overridden for setting additional flags or subcommands
  /// via mixins or direct overrides.
  @mustCallSuper
  void init() {
    AWSLogger()
      ..unregisterAllPlugins()
      ..registerPlugin(this);
  }

  late final AWSLogger logger = () {
    final allCommands = <String>[];
    for (Command<dynamic>? cmd = this; cmd != null; cmd = cmd.parent) {
      allCommands.add(cmd.name);
    }
    return AWSLogger().createChild(allCommands.reversed.join('.'));
  }();

  @override
  void handleLogEntry(LogEntry logEntry) {
    final message = verbose
        ? '${logEntry.loggerName} | ${logEntry.message}'
        : logEntry.message;
    switch (logEntry.level) {
      case LogLevel.verbose:
      case LogLevel.debug:
      case LogLevel.info:
        stdout.writeln(message);
        break;
      case LogLevel.warn:
      case LogLevel.error:
        stderr.writeln(message);
        break;
      case LogLevel.none:
        break;
    }
  }

  /// Whether verbose logging is enabled.
  bool get verbose =>
      globalResults?['verbose'] as bool? ??
      AWSLogger().logLevel == LogLevel.verbose;

  /// The current working directory.
  late final Directory workingDirectory = () {
    final directory = globalResults?['directory'] as String?;
    if (directory == null) {
      return Directory.current;
    }
    return Directory(directory);
  }();

  _PubHttpClient? _httpClient;

  /// HTTP client for remote operations.
  http.Client get httpClient => _httpClient ??= _PubHttpClient();

  /// The root directory of the Amplify Flutter repo.
  late final Directory rootDir = () {
    var dir = workingDirectory;
    while (p.absolute(dir.parent.path) != p.absolute(dir.path)) {
      final files = dir.listSync(followLinks: false).whereType<File>();
      for (final file in files) {
        if (p.basename(file.path) == 'aft.yaml') {
          return dir;
        }
      }
      dir = dir.parent;
    }
    throw StateError(
      'Root directory not found. Make sure to run this command '
      'from within the Amplify Flutter repo',
    );
  }();

  /// All packages in the Amplify Flutter repo.
  late final Map<String, PackageInfo> allPackages = () {
    final allDirs = rootDir
        .listSync(recursive: true, followLinks: false)
        .whereType<Directory>();
    final allPackages = <PackageInfo>[];
    for (final dir in allDirs) {
      final pubspecInfo = dir.pubspec;
      if (pubspecInfo == null) {
        continue;
      }
      final pubspec = pubspecInfo.pubspec;
      if (aftConfig.ignore.contains(pubspec.name)) {
        continue;
      }
      allPackages.add(
        PackageInfo(
          name: pubspec.name,
          path: dir.path,
          pubspecInfo: pubspecInfo,
          flavor: pubspec.flavor,
        ),
      );
    }
    return UnmodifiableMapView({
      for (final package in allPackages..sort()) package.name: package,
    });
  }();

  /// The absolute path to the `aft.yaml` document.
  late final String aftConfigPath = () {
    final rootDir = this.rootDir;
    return p.join(rootDir.path, 'aft.yaml');
  }();

  /// The global `aft` configuration for the repo.
  late final AftConfig aftConfig = () {
    final configFile = File(p.join(rootDir.path, 'aft.yaml'));
    assert(configFile.existsSync(), 'Could not find aft.yaml');
    final configYaml = configFile.readAsStringSync();
    final config = checkedYamlDecode(configYaml, AftConfig.fromJson);
    logger.verbose('$config');
    return config;
  }();

  late final Repo repo = Repo(
    rootDir,
    allPackages: allPackages,
    aftConfig: aftConfig,
    logger: logger,
  );

  /// Runs `git` with the given [args] from the repo's root directory.
  Future<void> runGit(
    List<String> args, {
    bool echoOutput = false,
  }) =>
      git.runGit(
        args,
        processWorkingDir: rootDir.path,
        throwOnError: true,
        echoOutput: echoOutput,
      );

  /// The `aft.yaml` document.
  String get aftConfigYaml {
    final configFile = File(aftConfigPath);
    assert(configFile.existsSync(), 'Could not find aft.yaml');
    return configFile.readAsStringSync();
  }

  /// A command runner for `pub`.
  PubCommandRunner createPubRunner() => PubCommandRunner(
        pubCommand(isVerbose: () => verbose),
      );

  /// Displays a prompt to the user and waits for a response on stdin.
  String prompt(String prompt) {
    String? response;
    while (response == null) {
      stdout.write(prompt);
      response = stdin.readLineSync();
    }
    return response;
  }

  /// Displays a yes/no prompt and returns whether the answer was positive.
  bool promptYesNo(String message) {
    final answer = prompt(message).toLowerCase();
    return answer == 'y' || answer == 'yes';
  }

  /// Resolves the latest version information from `pub.dev`.
  Future<PubVersionInfo?> resolveVersionInfo(String package) async {
    // Get the currently published version of the package.
    final uri = Uri.parse('https://pub.dev/api/packages/$package');
    final resp = await httpClient.get(
      uri,
      headers: {AWSHeaders.accept: 'application/vnd.pub.v2+json'},
    );

    // Package is unpublished
    if (resp.statusCode == 404) {
      return null;
    }
    if (resp.statusCode != 200) {
      throw http.ClientException(resp.body, uri);
    }

    final respJson = jsonDecode(resp.body) as Map<String, Object?>;
    final versions = (respJson['versions'] as List<Object?>?) ?? <Object?>[];
    final semvers = <Version>[];
    for (final version in versions) {
      final map = (version as Map).cast<String, Object?>();
      final semver = map['version'] as String?;
      if (semver == null) {
        continue;
      }
      semvers.add(Version.parse(semver));
    }

    return PubVersionInfo(semvers..sort());
  }

  @override
  @mustCallSuper
  Future<void> run() async {
    if (globalResults?['verbose'] as bool? ?? false) {
      AWSLogger().logLevel = LogLevel.verbose;
    }
  }

  @override
  @mustCallSuper
  void close() {
    _httpClient?._close();
  }
}

/// An HTTP client which can be used by processes which call `client.close()`
/// outside our control, like `pub`.
class _PubHttpClient extends http.BaseClient {
  _PubHttpClient([http.Client? inner]) : _inner = inner ?? http.Client();

  final http.Client _inner;

  @override
  Future<http.StreamedResponse> send(http.BaseRequest request) {
    return _inner.send(request);
  }

  @override
  void close() {
    // Do nothing
  }

  // Actually close
  void _close() {
    _inner.close();
  }
}