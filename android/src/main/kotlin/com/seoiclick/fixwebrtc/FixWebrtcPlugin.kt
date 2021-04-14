package com.seoiclick.fixwebrtc

import android.media.AudioAttributes
import android.media.AudioManager
import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.plugin.common.MethodChannel
import org.webrtc.voiceengine.WebRtcAudioTrack

class FixWebrtcPlugin : FlutterPlugin {

    override fun onAttachedToEngine(flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
        val channel = MethodChannel(flutterPluginBinding.binaryMessenger, "com.seoiclick.fixwebrtc/fixwebrtc")
        channel.setMethodCallHandler { call, result ->
            when (call.method) {
                "setAudioTrackUsageAttribute" -> {
                    setAudioTrackUsageAttribute(call.arguments as Int)
                    result.success(null)
                }
                else -> result.notImplemented()
            }
        }
    }

    override fun onDetachedFromEngine(binding: FlutterPlugin.FlutterPluginBinding) {
    }

    private fun setAudioTrackUsageAttribute(usage: Int) {
        check(usage == AudioAttributes.USAGE_MEDIA || usage == AudioAttributes.USAGE_VOICE_COMMUNICATION) {
            "Usage is expected to be only MEDIA or COMMUNICATION"
        }
        WebRtcAudioTrack.setAudioTrackUsageAttribute(usage)
        val clazz = Class.forName("org.webrtc.audio.WebRtcAudioTrack")
        val field = clazz.getDeclaredField("DEFAULT_USAGE")
        field.isAccessible = true
        field.setInt(null, usage)
    }
}
