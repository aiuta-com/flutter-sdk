import 'dart:convert';
import 'dart:ffi';

import 'package:aiutasdk/configuration/AiutaConfiguration.dart';
import 'package:aiutasdk/models/AiutaSKUItem.dart';
import 'package:aiutasdk/platform/fashionsdk_platform_interface.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

class MethodChannelAiuta extends AiutaPlatform {
  @visibleForTesting
  final methodChannel = const MethodChannel('aiutasdk');

  final aituaEventsChannel = EventChannel('aiutaActionsHandler');

  @override
  Future<void> startAiutaFlow({
    required AiutaSKUItem skuItem,
    required AiutaConfiguration configuration,
  }) {
    return methodChannel.invokeMethod(
      'startAiutaFlow',
      {
        "sku_item": jsonEncode(skuItem),
        "configuration": jsonEncode(configuration),
      },
    );
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
