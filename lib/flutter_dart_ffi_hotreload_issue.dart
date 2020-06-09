import 'dart:ffi';
import 'dart:io';
import 'dart:isolate';

final DynamicLibrary nativeLib = Platform.isIOS
    ? DynamicLibrary.process()
    : DynamicLibrary.open("libhot_reload_issue.so");

// #############################################################################
int Function() ffiStart =
    nativeLib.lookup<NativeFunction<Int32 Function()>>("start").asFunction();

void Function() ffiStop =
    nativeLib.lookup<NativeFunction<Void Function()>>("stop").asFunction();

// #############################################################################
class FlutterDartFfiHotreloadIssue {
  // ..........................................................................
  static bool _isStarted = false;

  // ..........................................................................
  static start() async {
    ReceivePort receivePort = ReceivePort();
    await Isolate.spawn(
      _startIsolate,
      receivePort.sendPort,
      paused: false,
    );
  }

  // ..........................................................................
  /// Stops the long running FFI method
  static stop() {
    _isStarted = false;
    ffiStop();
  }

  // ..........................................................................
  /// Starts a long running FFI method
  static _startIsolate(SendPort sendPort) {
    if (_isStarted) {
      return;
    }
    _isStarted = true;

    print(
        'Long running isolate => Hot Reload is broken. We need a callback that informs us *before* an hot reload is exectued. In that case we could call stop and interrupt the long running process.');
    final returnValue = ffiStart();
    print('Finished with return value $returnValue');
  }
}
