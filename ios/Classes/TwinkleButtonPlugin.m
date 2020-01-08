#import "TwinkleButtonPlugin.h"
#if __has_include(<twinkle_button/twinkle_button-Swift.h>)
#import <twinkle_button/twinkle_button-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "twinkle_button-Swift.h"
#endif

@implementation TwinkleButtonPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftTwinkleButtonPlugin registerWithRegistrar:registrar];
}
@end
