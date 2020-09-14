import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:lua_vm/lua_vm.dart';

void main() {
  const MethodChannel channel = MethodChannel('lua_vm');

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
    expect(await LuaVm.platformVersion, '42');
  });
}
