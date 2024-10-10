import 'dart:convert';
import 'package:aiutasdk/configuration/aiuta_configuration.dart';
import 'package:aiutasdk/models/product/aiuta_product.dart';
import 'package:aiutasdk/platform/aiutasdk_platform_interface.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

class MethodChannelAiuta extends AiutaPlatform {
  @visibleForTesting
  final methodChannel = const MethodChannel('aiutasdk');

  final aiutaActionsChannel = const EventChannel('aiutaActionsHandler');
  final aiutaJWTAuthActionsChannel = const EventChannel('aiutaJWTAuthHandler');

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
  Future<void> updateActiveAiutaProduct({
    required AiutaProduct updatedAiutaProduct,
  }) {
    return methodChannel.invokeMethod(
      'updateActiveAiutaProduct',
      {
        "product": jsonEncode(updatedAiutaProduct),
      },
    );
  }

  @override
  Future<void> resolveJWTAuth({
    required String newJWT,
  }) {
    return methodChannel.invokeMethod(
      'resolveJWTAuth',
      {
        "jwt": newJWT,
      },
    );
  }

  @override
  Stream<String> observeAiutaActions() {
    return aiutaActionsChannel
        .receiveBroadcastStream()
        .map((event) => event.toString());
  }

  @override
  Stream<String> observeAiutaJWTAuthActions() {
    return aiutaJWTAuthActionsChannel
        .receiveBroadcastStream()
        .map((event) => event.toString());
  }
}