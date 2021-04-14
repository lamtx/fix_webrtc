#import "FixWebrtcPlugin.h"
#if __has_include(<fix_webrtc/fix_webrtc-Swift.h>)
#import <fix_webrtc/fix_webrtc-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "fix_webrtc-Swift.h"
#endif

@implementation FixWebrtcPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftFixWebrtcPlugin registerWithRegistrar:registrar];
}
@end
