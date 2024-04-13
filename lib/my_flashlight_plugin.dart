
import 'my_flashlight_plugin_platform_interface.dart';

class MyFlashlightPlugin {
  Future<String?> getPlatformVersion() {
    return MyFlashlightPluginPlatform.instance.getPlatformVersion();
  }

  static Future<void> turnFlashlightOn() {
    return MyFlashlightPluginPlatform.instance.turnFlashlightOn();
  }

  static Future<void> turnFlashlightOff() {
    return MyFlashlightPluginPlatform.instance.turnFlashlightOff();
  }
}
