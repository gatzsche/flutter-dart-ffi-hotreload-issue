import Flutter
import UIKit

public class SwiftFlutterDartFfiHotreloadIssuePlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "flutter_dart_ffi_hotreload_issue", binaryMessenger: registrar.messenger())
    let instance = SwiftFlutterDartFfiHotreloadIssuePlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    result("iOS " + UIDevice.current.systemVersion)
  }
}
