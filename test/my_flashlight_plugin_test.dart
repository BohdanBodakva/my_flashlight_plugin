import 'package:flutter_test/flutter_test.dart';
import 'package:my_flashlight_plugin/my_flashlight_plugin.dart';
import 'package:my_flashlight_plugin/my_flashlight_plugin_platform_interface.dart';
import 'package:my_flashlight_plugin/my_flashlight_plugin_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockMyFlashlightPluginPlatform
    with MockPlatformInterfaceMixin
    implements MyFlashlightPluginPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');

  @override
  Future<void> turnFlashlightOn() => Future.value();

  @override
  Future<void> turnFlashlightOff() => Future.value();
}

void main() {
  final MyFlashlightPluginPlatform initialPlatform = MyFlashlightPluginPlatform.instance;

  test('$MethodChannelMyFlashlightPlugin is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelMyFlashlightPlugin>());
  });

  test('getPlatformVersion', () async {
    MyFlashlightPlugin myFlashlightPlugin = MyFlashlightPlugin();
    MockMyFlashlightPluginPlatform fakePlatform = MockMyFlashlightPluginPlatform();
    MyFlashlightPluginPlatform.instance = fakePlatform;

    expect(await myFlashlightPlugin.getPlatformVersion(), '42');
  });

  test('turnFlashlightOn', () async {
    MyFlashlightPluginPlatform fakePlatform = MockMyFlashlightPluginPlatform();
    MyFlashlightPluginPlatform.instance = fakePlatform;

    await MyFlashlightPlugin.turnFlashlightOn();
  });

  test('turnFlashlightOff', () async {
    MyFlashlightPluginPlatform fakePlatform = MockMyFlashlightPluginPlatform();
    MyFlashlightPluginPlatform.instance = fakePlatform;

    await MyFlashlightPlugin.turnFlashlightOff();
  });
}
