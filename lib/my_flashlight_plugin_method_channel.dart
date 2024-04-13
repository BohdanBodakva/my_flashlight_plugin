import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'my_flashlight_plugin_platform_interface.dart';

/// An implementation of [MyFlashlightPluginPlatform] that uses method channels.
class MethodChannelMyFlashlightPlugin extends MyFlashlightPluginPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('my_flashlight_channel');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }

  @override
  Future<void> turnFlashlightOn() async {
    try {
      await methodChannel.invokeMethod<void>('turnFlashlightOn');
    } on PlatformException catch (e) {
      throw 'Error: ${e.message}';
    }
  }

  @override
  Future<void> turnFlashlightOff() async {
    try {
      await methodChannel.invokeMethod<void>('turnFlashlightOff');
    } on PlatformException catch (e) {
      throw 'Error: ${e.message}';
    }
  }
}
