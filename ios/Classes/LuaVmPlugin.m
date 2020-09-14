#import "LuaVmPlugin.h"
#if __has_include(<lua_vm/lua_vm-Swift.h>)
#import <lua_vm/lua_vm-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "lua_vm-Swift.h"
#endif

@implementation LuaVmPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftLuaVmPlugin registerWithRegistrar:registrar];
}
@end
