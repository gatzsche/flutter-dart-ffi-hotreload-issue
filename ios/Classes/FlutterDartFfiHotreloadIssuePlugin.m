#import "FlutterDartFfiHotreloadIssuePlugin.h"
#if __has_include(<flutter_dart_ffi_hotreload_issue/flutter_dart_ffi_hotreload_issue-Swift.h>)
#import <flutter_dart_ffi_hotreload_issue/flutter_dart_ffi_hotreload_issue-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "flutter_dart_ffi_hotreload_issue-Swift.h"
#endif

@implementation FlutterDartFfiHotreloadIssuePlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftFlutterDartFfiHotreloadIssuePlugin registerWithRegistrar:registrar];
}
@end
