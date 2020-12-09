# Hot Reload Issues with Long Running Isolates

## Summary

This sample projects demonstrates an issue (https://github.com/flutter/flutter/issues/59061) with hot reload and dart FFI.

- The project creates an isoloate
- The isolate calls a long running C function `start` via FFI
- There is a second C function called `stop` whichs stops the first function
- The long running isolate breaks hot reloading and hot restart

We need a callback informing the application about an upcoming hot reload.
The callback then can call the stop function to stop the long running isolate
Once stopped hot reloading will work as expected.

## Existing Solutions

[There is already a `reassemble` method](https://stackoverflow.com/questions/55281077/how-to-detect-hot-reload-inside-the-code-of-a-flutter-app) on `State` class which can be overridden.
But this method informs only **after** a reload has been performed, note before.

## Example App

- Open a terminal 
- Type `flutter pub get`
- Type `cd example`
- Type `flutter run`
- In the console: Press `Shift + r` -> Hot restart will work
- In the app: Click the `Start` button and start a long running isolate
- In the console: Press `Shift + r` -> **Hot restart is not working**
- In the app: Click the `Stop` button  -> Long running process is stopped
- In the console: A message appeared, that hot reload was performed

## Code Files

| File                                        | Description                                              |
| :------------------------------------------ | :------------------------------------------------------- |
| `ios/Classes/StartStop.cpp`                 | The long running native code                             |
| `lib/flutter_dart_ffi_hotreload_issue.dart` | Code for starting an isolate with a long running process |
| `example/lib/main.dart`                     | The user interface                                       |

## Related Sources

- [Stack Overflow: How to detect hot reload inside the code of a Flutter App?
  ](https://stackoverflow.com/questions/55281077/how-to-detect-hot-reload-inside-the-code-of-a-flutter-app)
- [GitHub, Flutter: Flutter app spawns with two isolates, hot reload fails with Error 105: Isolate must be runnable](https://github.com/flutter/flutter/issues/26953)
- [Reddit: Execute Code on Hot Reload](https://www.reddit.com/r/FlutterDev/comments/79f5hi/execute_code_on_hot_reload/)
