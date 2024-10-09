import 'dart:convert';
import 'dart:ffi';
import 'package:aiutasdk/configuration/AiutaConfiguration.dart';
import 'package:aiutasdk/models/AiutaProduct.dart';
import 'package:aiutasdk/platform/fashionsdk_platform_interface.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

class MethodChannelAiuta extends AiutaPlatform {
  @visibleForTesting
  final methodChannel = const MethodChannel('aiutasdk');

  final aituaEventsChannel = EventChannel('aiutaActionsHandler');

  @override
  Future<void> startAiutaFlow({
    required AiutaProduct product,
    required AiutaConfiguration configuration,
  }) {
    return methodChannel.invokeMethod(
      'startAiutaFlow',
      {
        "product": jsonEncode(product),
        "configuration": jsonEncode(configuration),
      },
    );
  }

  @override
  Stream<String> observeAiutaEvent() {
    return aituaEventsChannel
        .receiveBroadcastStream()
        .map((event) => event.toString());
  }
}
