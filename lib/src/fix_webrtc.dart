import 'dart:async';

import 'package:flutter/services.dart';

class FixWebrtc {
  static const _channel =
      const MethodChannel('com.seoiclick.fixwebrtc/fixwebrtc');

  static Future<void> setAudioTrackUsageAttribute(AudioTrackUsage usage) {
    return _channel.invokeMethod("setAudioTrackUsageAttribute", usage.index);
  }
}

enum AudioTrackUsage { none, media, communication }
