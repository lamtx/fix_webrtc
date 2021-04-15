import 'dart:async';
import 'dart:io';

import 'package:flutter/services.dart';

class FixWebrtc {
  static const _channel =
      const MethodChannel('com.seoiclick.fixwebrtc/fixwebrtc');

  static Future<void> setAudioTrackUsageAttribute(AudioTrackUsage usage) {
    if (Platform.isAndroid) {
      return _channel.invokeMethod("setAudioTrackUsageAttribute", usage.index);
    } else {
      return Future.value();
    }
  }
}

enum AudioTrackUsage { none, media, communication }
