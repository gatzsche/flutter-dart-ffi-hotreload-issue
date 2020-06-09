# flutter-dart-ffi-hotreload-issue

## Summary

This sample projects demonstrates an issue with hot reload and dart FFI.

- The project creates an isoloate
- The isolate calls a long running C function `start` via FFI
- There is a second C function called `stop`whichs stops the first function
- The long running isolate breaks hot reloading and hot restart

## What we Need

- We need a callback informing the application about an upcoming hot reload
- The callback then can call the stop function to stop the long running isolate
- Once stopped hot reloading will work as expected

## Sample App

~~~bash
flutter create --template=plugin flutter_dart_ffi_hotreload_issue
cd flutter_dart_ffi_hotreload_issue
cd example
flutter run
~~~

