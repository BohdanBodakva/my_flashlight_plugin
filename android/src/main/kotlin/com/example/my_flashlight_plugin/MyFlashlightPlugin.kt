package com.example.my_flashlight_plugin

import android.content.Context
import android.hardware.camera2.CameraAccessException
import android.hardware.camera2.CameraManager
import androidx.annotation.NonNull
import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result

class MyFlashlightPlugin : FlutterPlugin, MethodCallHandler {
  private lateinit var channel: MethodChannel
  private lateinit var context: Context
  private var cameraManager: CameraManager? = null

  override fun onAttachedToEngine(@NonNull flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
    channel = MethodChannel(flutterPluginBinding.binaryMessenger, "my_flashlight_channel")
    channel.setMethodCallHandler(this)
    context = flutterPluginBinding.applicationContext
    cameraManager = context.getSystemService(Context.CAMERA_SERVICE) as CameraManager
  }

  override fun onMethodCall(@NonNull call: MethodCall, @NonNull result: Result) {
    when (call.method) {
      "turnFlashlightOn" -> {
        turnFlashlightOn()
        result.success(null)
      }
      "turnFlashlightOff" -> {
        turnFlashlightOff()
        result.success(null)
      }
      else -> result.notImplemented()
    }
  }

  private fun turnFlashlightOn() {
    try {
      val cameraId = cameraManager?.cameraIdList?.firstOrNull()
      cameraId?.let {
        cameraManager?.setTorchMode(it, true)
      }
    } catch (e: CameraAccessException) {
      e.printStackTrace()
    }
  }

  private fun turnFlashlightOff() {
    try {
      val cameraId = cameraManager?.cameraIdList?.firstOrNull()
      cameraId?.let {
        cameraManager?.setTorchMode(it, false)
      }
    } catch (e: CameraAccessException) {
      e.printStackTrace()
    }
  }

  override fun onDetachedFromEngine(@NonNull binding: FlutterPlugin.FlutterPluginBinding) {
    channel.setMethodCallHandler(null)
  }
}