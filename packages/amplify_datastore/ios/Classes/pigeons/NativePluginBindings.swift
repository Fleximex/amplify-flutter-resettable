// 
// Copyright Amazon.com, Inc. or its affiliates. All Rights Reserved.
// SPDX-License-Identifier: Apache-2.0
// Autogenerated from Pigeon (v11.0.1), do not edit directly.
// See also: https://pub.dev/packages/pigeon

import Foundation
#if os(iOS)
import Flutter
#elseif os(macOS)
import FlutterMacOS
#else
#error("Unsupported platform.")
#endif

private func isNullish(_ value: Any?) -> Bool {
  return value is NSNull || value == nil
}

private func wrapResult(_ result: Any?) -> [Any?] {
  return [result]
}

private func wrapError(_ error: Any) -> [Any?] {
  if let flutterError = error as? FlutterError {
    return [
      flutterError.code,
      flutterError.message,
      flutterError.details
    ]
  }
  return [
    "\(error)",
    "\(type(of: error))",
    "Stacktrace: \(Thread.callStackSymbols)"
  ]
}

private func nilOrValue<T>(_ value: Any?) -> T? {
  if value is NSNull { return nil }
  return value as! T?
}

/// Generated class from Pigeon that represents data sent in messages.
struct NativeAuthSession {
  var isSignedIn: Bool
  var userSub: String? = nil
  var userPoolTokens: NativeUserPoolTokens? = nil
  var identityId: String? = nil
  var awsCredentials: NativeAWSCredentials? = nil

  static func fromList(_ list: [Any?]) -> NativeAuthSession? {
    let isSignedIn = list[0] as! Bool
    let userSub: String? = nilOrValue(list[1])
    var userPoolTokens: NativeUserPoolTokens? = nil
    if let userPoolTokensList: [Any?] = nilOrValue(list[2]) {
      userPoolTokens = NativeUserPoolTokens.fromList(userPoolTokensList)
    }
    let identityId: String? = nilOrValue(list[3])
    var awsCredentials: NativeAWSCredentials? = nil
    if let awsCredentialsList: [Any?] = nilOrValue(list[4]) {
      awsCredentials = NativeAWSCredentials.fromList(awsCredentialsList)
    }

    return NativeAuthSession(
      isSignedIn: isSignedIn,
      userSub: userSub,
      userPoolTokens: userPoolTokens,
      identityId: identityId,
      awsCredentials: awsCredentials
    )
  }
  func toList() -> [Any?] {
    return [
      isSignedIn,
      userSub,
      userPoolTokens?.toList(),
      identityId,
      awsCredentials?.toList(),
    ]
  }
}

/// Generated class from Pigeon that represents data sent in messages.
struct NativeAuthUser {
  var userId: String
  var username: String

  static func fromList(_ list: [Any?]) -> NativeAuthUser? {
    let userId = list[0] as! String
    let username = list[1] as! String

    return NativeAuthUser(
      userId: userId,
      username: username
    )
  }
  func toList() -> [Any?] {
    return [
      userId,
      username,
    ]
  }
}

/// Generated class from Pigeon that represents data sent in messages.
struct NativeUserPoolTokens {
  var accessToken: String
  var refreshToken: String
  var idToken: String

  static func fromList(_ list: [Any?]) -> NativeUserPoolTokens? {
    let accessToken = list[0] as! String
    let refreshToken = list[1] as! String
    let idToken = list[2] as! String

    return NativeUserPoolTokens(
      accessToken: accessToken,
      refreshToken: refreshToken,
      idToken: idToken
    )
  }
  func toList() -> [Any?] {
    return [
      accessToken,
      refreshToken,
      idToken,
    ]
  }
}

/// Generated class from Pigeon that represents data sent in messages.
struct NativeAWSCredentials {
  var accessKeyId: String
  var secretAccessKey: String
  var sessionToken: String? = nil
  var expirationIso8601Utc: String? = nil

  static func fromList(_ list: [Any?]) -> NativeAWSCredentials? {
    let accessKeyId = list[0] as! String
    let secretAccessKey = list[1] as! String
    let sessionToken: String? = nilOrValue(list[2])
    let expirationIso8601Utc: String? = nilOrValue(list[3])

    return NativeAWSCredentials(
      accessKeyId: accessKeyId,
      secretAccessKey: secretAccessKey,
      sessionToken: sessionToken,
      expirationIso8601Utc: expirationIso8601Utc
    )
  }
  func toList() -> [Any?] {
    return [
      accessKeyId,
      secretAccessKey,
      sessionToken,
      expirationIso8601Utc,
    ]
  }
}

/// Generated class from Pigeon that represents data sent in messages.
struct NativeGraphQLResponse {
  var payloadJson: String? = nil

  static func fromList(_ list: [Any?]) -> NativeGraphQLResponse? {
    let payloadJson: String? = nilOrValue(list[0])

    return NativeGraphQLResponse(
      payloadJson: payloadJson
    )
  }
  func toList() -> [Any?] {
    return [
      payloadJson,
    ]
  }
}

/// Generated class from Pigeon that represents data sent in messages.
struct NativeGraphQLSubscriptionResponse {
  var type: String
  var subscriptionId: String
  var payloadJson: String? = nil

  static func fromList(_ list: [Any?]) -> NativeGraphQLSubscriptionResponse? {
    let type = list[0] as! String
    let subscriptionId = list[1] as! String
    let payloadJson: String? = nilOrValue(list[2])

    return NativeGraphQLSubscriptionResponse(
      type: type,
      subscriptionId: subscriptionId,
      payloadJson: payloadJson
    )
  }
  func toList() -> [Any?] {
    return [
      type,
      subscriptionId,
      payloadJson,
    ]
  }
}

/// Generated class from Pigeon that represents data sent in messages.
struct NativeGraphQLRequest {
  var document: String
  var apiName: String? = nil
  var variablesJson: String? = nil
  var responseType: String? = nil
  var decodePath: String? = nil
  var options: String? = nil
  var authMode: String? = nil

  static func fromList(_ list: [Any?]) -> NativeGraphQLRequest? {
    let document = list[0] as! String
    let apiName: String? = nilOrValue(list[1])
    let variablesJson: String? = nilOrValue(list[2])
    let responseType: String? = nilOrValue(list[3])
    let decodePath: String? = nilOrValue(list[4])
    let options: String? = nilOrValue(list[5])
    let authMode: String? = nilOrValue(list[6])

    return NativeGraphQLRequest(
      document: document,
      apiName: apiName,
      variablesJson: variablesJson,
      responseType: responseType,
      decodePath: decodePath,
      options: options,
      authMode: authMode
    )
  }
  func toList() -> [Any?] {
    return [
      document,
      apiName,
      variablesJson,
      responseType,
      decodePath,
      options,
      authMode,
    ]
  }
}

private class NativeAuthPluginCodecReader: FlutterStandardReader {
  override func readValue(ofType type: UInt8) -> Any? {
    switch type {
      case 128:
        return NativeAWSCredentials.fromList(self.readValue() as! [Any?])
      case 129:
        return NativeAuthSession.fromList(self.readValue() as! [Any?])
      case 130:
        return NativeUserPoolTokens.fromList(self.readValue() as! [Any?])
      default:
        return super.readValue(ofType: type)
    }
  }
}

private class NativeAuthPluginCodecWriter: FlutterStandardWriter {
  override func writeValue(_ value: Any) {
    if let value = value as? NativeAWSCredentials {
      super.writeByte(128)
      super.writeValue(value.toList())
    } else if let value = value as? NativeAuthSession {
      super.writeByte(129)
      super.writeValue(value.toList())
    } else if let value = value as? NativeUserPoolTokens {
      super.writeByte(130)
      super.writeValue(value.toList())
    } else {
      super.writeValue(value)
    }
  }
}

private class NativeAuthPluginCodecReaderWriter: FlutterStandardReaderWriter {
  override func reader(with data: Data) -> FlutterStandardReader {
    return NativeAuthPluginCodecReader(data: data)
  }

  override func writer(with data: NSMutableData) -> FlutterStandardWriter {
    return NativeAuthPluginCodecWriter(data: data)
  }
}

class NativeAuthPluginCodec: FlutterStandardMessageCodec {
  static let shared = NativeAuthPluginCodec(readerWriter: NativeAuthPluginCodecReaderWriter())
}

/// Bridge for calling Auth from Native into Flutter
///
/// Generated class from Pigeon that represents Flutter messages that can be called from Swift.
class NativeAuthPlugin {
  private let binaryMessenger: FlutterBinaryMessenger
  init(binaryMessenger: FlutterBinaryMessenger){
    self.binaryMessenger = binaryMessenger
  }
  var codec: FlutterStandardMessageCodec {
    return NativeAuthPluginCodec.shared
  }
  func fetchAuthSession(completion: @escaping (NativeAuthSession) -> Void) {
    let channel = FlutterBasicMessageChannel(name: "dev.flutter.pigeon.amplify_datastore.NativeAuthPlugin.fetchAuthSession", binaryMessenger: binaryMessenger, codec: codec)
    channel.sendMessage(nil) { response in
      let result = response as! NativeAuthSession
      completion(result)
    }
  }
}
private class NativeApiPluginCodecReader: FlutterStandardReader {
  override func readValue(ofType type: UInt8) -> Any? {
    switch type {
      case 128:
        return NativeGraphQLRequest.fromList(self.readValue() as! [Any?])
      case 129:
        return NativeGraphQLResponse.fromList(self.readValue() as! [Any?])
      case 130:
        return NativeGraphQLSubscriptionResponse.fromList(self.readValue() as! [Any?])
      default:
        return super.readValue(ofType: type)
    }
  }
}

private class NativeApiPluginCodecWriter: FlutterStandardWriter {
  override func writeValue(_ value: Any) {
    if let value = value as? NativeGraphQLRequest {
      super.writeByte(128)
      super.writeValue(value.toList())
    } else if let value = value as? NativeGraphQLResponse {
      super.writeByte(129)
      super.writeValue(value.toList())
    } else if let value = value as? NativeGraphQLSubscriptionResponse {
      super.writeByte(130)
      super.writeValue(value.toList())
    } else {
      super.writeValue(value)
    }
  }
}

private class NativeApiPluginCodecReaderWriter: FlutterStandardReaderWriter {
  override func reader(with data: Data) -> FlutterStandardReader {
    return NativeApiPluginCodecReader(data: data)
  }

  override func writer(with data: NSMutableData) -> FlutterStandardWriter {
    return NativeApiPluginCodecWriter(data: data)
  }
}

class NativeApiPluginCodec: FlutterStandardMessageCodec {
  static let shared = NativeApiPluginCodec(readerWriter: NativeApiPluginCodecReaderWriter())
}

/// Bridge for calling API plugin from Native into Flutter
///
/// Generated class from Pigeon that represents Flutter messages that can be called from Swift.
class NativeApiPlugin {
  private let binaryMessenger: FlutterBinaryMessenger
  init(binaryMessenger: FlutterBinaryMessenger){
    self.binaryMessenger = binaryMessenger
  }
  var codec: FlutterStandardMessageCodec {
    return NativeApiPluginCodec.shared
  }
  func getLatestAuthToken(providerName providerNameArg: String, completion: @escaping (String?) -> Void) {
    let channel = FlutterBasicMessageChannel(name: "dev.flutter.pigeon.amplify_datastore.NativeApiPlugin.getLatestAuthToken", binaryMessenger: binaryMessenger, codec: codec)
    channel.sendMessage([providerNameArg] as [Any?]) { response in
      let result: String? = nilOrValue(response)
      completion(result)
    }
  }
  func getEndpointAuthorizationType(apiName apiNameArg: String?, completion: @escaping (String?) -> Void) {
    let channel = FlutterBasicMessageChannel(name: "dev.flutter.pigeon.amplify_datastore.NativeApiPlugin.getEndpointAuthorizationType", binaryMessenger: binaryMessenger, codec: codec)
    channel.sendMessage([apiNameArg] as [Any?]) { response in
      let result: String? = nilOrValue(response)
      completion(result)
    }
  }
  func mutate(request requestArg: NativeGraphQLRequest, completion: @escaping (NativeGraphQLResponse) -> Void) {
    let channel = FlutterBasicMessageChannel(name: "dev.flutter.pigeon.amplify_datastore.NativeApiPlugin.mutate", binaryMessenger: binaryMessenger, codec: codec)
    channel.sendMessage([requestArg] as [Any?]) { response in
      let result = response as! NativeGraphQLResponse
      completion(result)
    }
  }
  func query(request requestArg: NativeGraphQLRequest, completion: @escaping (NativeGraphQLResponse) -> Void) {
    let channel = FlutterBasicMessageChannel(name: "dev.flutter.pigeon.amplify_datastore.NativeApiPlugin.query", binaryMessenger: binaryMessenger, codec: codec)
    channel.sendMessage([requestArg] as [Any?]) { response in
      let result = response as! NativeGraphQLResponse
      completion(result)
    }
  }
  func subscribe(request requestArg: NativeGraphQLRequest, completion: @escaping (NativeGraphQLSubscriptionResponse) -> Void) {
    let channel = FlutterBasicMessageChannel(name: "dev.flutter.pigeon.amplify_datastore.NativeApiPlugin.subscribe", binaryMessenger: binaryMessenger, codec: codec)
    channel.sendMessage([requestArg] as [Any?]) { response in
      let result = response as! NativeGraphQLSubscriptionResponse
      completion(result)
    }
  }
  func unsubscribe(subscriptionId subscriptionIdArg: String, completion: @escaping () -> Void) {
    let channel = FlutterBasicMessageChannel(name: "dev.flutter.pigeon.amplify_datastore.NativeApiPlugin.unsubscribe", binaryMessenger: binaryMessenger, codec: codec)
    channel.sendMessage([subscriptionIdArg] as [Any?]) { _ in
      completion()
    }
  }
}
/// Bridge for calling Amplify from Flutter into Native
///
/// Generated protocol from Pigeon that represents a handler of messages from Flutter.
protocol NativeAmplifyBridge {
  func configure(version: String, config: String, completion: @escaping (Result<Void, Error>) -> Void)
}

/// Generated setup class from Pigeon to handle messages through the `binaryMessenger`.
class NativeAmplifyBridgeSetup {
  /// The codec used by NativeAmplifyBridge.
  /// Sets up an instance of `NativeAmplifyBridge` to handle messages through the `binaryMessenger`.
  static func setUp(binaryMessenger: FlutterBinaryMessenger, api: NativeAmplifyBridge?) {
    let configureChannel = FlutterBasicMessageChannel(name: "dev.flutter.pigeon.amplify_datastore.NativeAmplifyBridge.configure", binaryMessenger: binaryMessenger)
    if let api = api {
      configureChannel.setMessageHandler { message, reply in
        let args = message as! [Any?]
        let versionArg = args[0] as! String
        let configArg = args[1] as! String
        api.configure(version: versionArg, config: configArg) { result in
          switch result {
            case .success:
              reply(wrapResult(nil))
            case .failure(let error):
              reply(wrapError(error))
          }
        }
      }
    } else {
      configureChannel.setMessageHandler(nil)
    }
  }
}
private class NativeAuthBridgeCodecReader: FlutterStandardReader {
  override func readValue(ofType type: UInt8) -> Any? {
    switch type {
      case 128:
        return NativeAuthUser.fromList(self.readValue() as! [Any?])
      default:
        return super.readValue(ofType: type)
    }
  }
}

private class NativeAuthBridgeCodecWriter: FlutterStandardWriter {
  override func writeValue(_ value: Any) {
    if let value = value as? NativeAuthUser {
      super.writeByte(128)
      super.writeValue(value.toList())
    } else {
      super.writeValue(value)
    }
  }
}

private class NativeAuthBridgeCodecReaderWriter: FlutterStandardReaderWriter {
  override func reader(with data: Data) -> FlutterStandardReader {
    return NativeAuthBridgeCodecReader(data: data)
  }

  override func writer(with data: NSMutableData) -> FlutterStandardWriter {
    return NativeAuthBridgeCodecWriter(data: data)
  }
}

class NativeAuthBridgeCodec: FlutterStandardMessageCodec {
  static let shared = NativeAuthBridgeCodec(readerWriter: NativeAuthBridgeCodecReaderWriter())
}

/// Bridge for calling Auth plugin from Flutter into Native
///
/// Generated protocol from Pigeon that represents a handler of messages from Flutter.
protocol NativeAuthBridge {
  func addAuthPlugin(completion: @escaping (Result<Void, Error>) -> Void)
  func updateCurrentUser(user: NativeAuthUser?) throws
}

/// Generated setup class from Pigeon to handle messages through the `binaryMessenger`.
class NativeAuthBridgeSetup {
  /// The codec used by NativeAuthBridge.
  static var codec: FlutterStandardMessageCodec { NativeAuthBridgeCodec.shared }
  /// Sets up an instance of `NativeAuthBridge` to handle messages through the `binaryMessenger`.
  static func setUp(binaryMessenger: FlutterBinaryMessenger, api: NativeAuthBridge?) {
    let addAuthPluginChannel = FlutterBasicMessageChannel(name: "dev.flutter.pigeon.amplify_datastore.NativeAuthBridge.addAuthPlugin", binaryMessenger: binaryMessenger, codec: codec)
    if let api = api {
      addAuthPluginChannel.setMessageHandler { _, reply in
        api.addAuthPlugin() { result in
          switch result {
            case .success:
              reply(wrapResult(nil))
            case .failure(let error):
              reply(wrapError(error))
          }
        }
      }
    } else {
      addAuthPluginChannel.setMessageHandler(nil)
    }
    let updateCurrentUserChannel = FlutterBasicMessageChannel(name: "dev.flutter.pigeon.amplify_datastore.NativeAuthBridge.updateCurrentUser", binaryMessenger: binaryMessenger, codec: codec)
    if let api = api {
      updateCurrentUserChannel.setMessageHandler { message, reply in
        let args = message as! [Any?]
        let userArg: NativeAuthUser? = nilOrValue(args[0])
        do {
          try api.updateCurrentUser(user: userArg)
          reply(wrapResult(nil))
        } catch {
          reply(wrapError(error))
        }
      }
    } else {
      updateCurrentUserChannel.setMessageHandler(nil)
    }
  }
}
private class NativeApiBridgeCodecReader: FlutterStandardReader {
  override func readValue(ofType type: UInt8) -> Any? {
    switch type {
      case 128:
        return NativeGraphQLSubscriptionResponse.fromList(self.readValue() as! [Any?])
      default:
        return super.readValue(ofType: type)
    }
  }
}

private class NativeApiBridgeCodecWriter: FlutterStandardWriter {
  override func writeValue(_ value: Any) {
    if let value = value as? NativeGraphQLSubscriptionResponse {
      super.writeByte(128)
      super.writeValue(value.toList())
    } else {
      super.writeValue(value)
    }
  }
}

private class NativeApiBridgeCodecReaderWriter: FlutterStandardReaderWriter {
  override func reader(with data: Data) -> FlutterStandardReader {
    return NativeApiBridgeCodecReader(data: data)
  }

  override func writer(with data: NSMutableData) -> FlutterStandardWriter {
    return NativeApiBridgeCodecWriter(data: data)
  }
}

class NativeApiBridgeCodec: FlutterStandardMessageCodec {
  static let shared = NativeApiBridgeCodec(readerWriter: NativeApiBridgeCodecReaderWriter())
}

/// Bridge for calling API methods from Flutter into Native
///
/// Generated protocol from Pigeon that represents a handler of messages from Flutter.
protocol NativeApiBridge {
  func addApiPlugin(authProvidersList: [String], completion: @escaping (Result<Void, Error>) -> Void)
  func sendSubscriptionEvent(event: NativeGraphQLSubscriptionResponse, completion: @escaping (Result<Void, Error>) -> Void)
}

/// Generated setup class from Pigeon to handle messages through the `binaryMessenger`.
class NativeApiBridgeSetup {
  /// The codec used by NativeApiBridge.
  static var codec: FlutterStandardMessageCodec { NativeApiBridgeCodec.shared }
  /// Sets up an instance of `NativeApiBridge` to handle messages through the `binaryMessenger`.
  static func setUp(binaryMessenger: FlutterBinaryMessenger, api: NativeApiBridge?) {
    let addApiPluginChannel = FlutterBasicMessageChannel(name: "dev.flutter.pigeon.amplify_datastore.NativeApiBridge.addApiPlugin", binaryMessenger: binaryMessenger, codec: codec)
    if let api = api {
      addApiPluginChannel.setMessageHandler { message, reply in
        let args = message as! [Any?]
        let authProvidersListArg = args[0] as! [String]
        api.addApiPlugin(authProvidersList: authProvidersListArg) { result in
          switch result {
            case .success:
              reply(wrapResult(nil))
            case .failure(let error):
              reply(wrapError(error))
          }
        }
      }
    } else {
      addApiPluginChannel.setMessageHandler(nil)
    }
    let sendSubscriptionEventChannel = FlutterBasicMessageChannel(name: "dev.flutter.pigeon.amplify_datastore.NativeApiBridge.sendSubscriptionEvent", binaryMessenger: binaryMessenger, codec: codec)
    if let api = api {
      sendSubscriptionEventChannel.setMessageHandler { message, reply in
        let args = message as! [Any?]
        let eventArg = args[0] as! NativeGraphQLSubscriptionResponse
        api.sendSubscriptionEvent(event: eventArg) { result in
          switch result {
            case .success:
              reply(wrapResult(nil))
            case .failure(let error):
              reply(wrapError(error))
          }
        }
      }
    } else {
      sendSubscriptionEventChannel.setMessageHandler(nil)
    }
  }
}
