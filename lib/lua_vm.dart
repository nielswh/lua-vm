
import 'dart:async';
import 'dart:ffi'; // For FFI
import 'dart:io'; // For Platform.isX

import 'package:ffi/ffi.dart';


import 'package:flutter/services.dart';

final DynamicLibrary lua = Platform.isAndroid
    ? DynamicLibrary.open("liblua.so")
    : DynamicLibrary.process();

typedef doStringFunc = Int32 Function(IntPtr instance, Pointer<Utf8> name);
typedef DoString = Int32 Function(IntPtr instance, Pointer<Utf8> name);

class LuaVm {
  static const MethodChannel _channel = const MethodChannel('lua_vm');

  static Future<String> get platformVersion async {
    final String version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }


  static int Function() _luaInstance = lua.lookup<NativeFunction<Int32 Function()>>("luaL_newstate").asFunction();
   static int Function(int, Pointer<Utf8>) _luaDostring = lua.lookup<NativeFunction<Int32 Function(Int32, Pointer<Utf8>)>>("luaL_dostring").asFunction();
  

  static String helloWorld() {
     int instance = _luaInstance();
     int result = _luaDostring(instance, Utf8.toUtf8("A = 7 + 11"));
     

     print('$instance, $result');

      return "Hello World";
  }
}
