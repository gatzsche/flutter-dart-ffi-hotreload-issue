import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_dart_ffi_hotreload_issue/flutter_dart_ffi_hotreload_issue.dart';

void main() {
  const MethodChannel channel = MethodChannel('flutter_dart_ffi_hotreload_issue');

  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return '42';
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  test('getPlatformVersion', () async {
    expect(await FlutterDartFfiHotreloadIssue.platformVersion, '42');
  });
}
