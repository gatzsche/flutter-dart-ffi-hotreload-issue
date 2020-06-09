import 'dart:async';

import 'package:flutter/services.dart';

class FlutterDartFfiHotreloadIssue {
  static const MethodChannel _channel =
      const MethodChannel('flutter_dart_ffi_hotreload_issue');

  static Future<String> get platformVersion async {
    final String version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }
}
