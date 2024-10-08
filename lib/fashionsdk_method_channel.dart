import 'dart:ffi';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'fashionsdk_platform_interface.dart';

class MethodChannelFashionsdk extends FashionsdkPlatform {
  @visibleForTesting
  final methodChannel = const MethodChannel('aiutasdk');

  final aituaEventsChannel = EventChannel('aiutaActionsHandler');

  @override
  Future<String?> getPlatformVersion() async {
    final version =
        await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }

  @override
  Future<void> startAiutaFlow() {
    return methodChannel.invokeMethod('startAiutaFlow');
  }

  @override
  Future<void> startAiutaBottomSheetFlow() {
    return methodChannel.invokeMethod('startAiutaBottomSheetFlow');
  }

  @override
  Future<void> startAiutaShareAssetFlow() {
    return methodChannel.invokeMethod('startAiutaShareAssetFlow');
  }

  @override
  Stream<String> observeAiutaEvent() {
    return aituaEventsChannel
        .receiveBroadcastStream()
        .map((event) => event.toString());
  }
}
