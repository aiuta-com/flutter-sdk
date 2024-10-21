import 'dart:convert';
import 'package:aiuta_flutter/configuration/aiuta_configuration.dart';
import 'package:aiuta_flutter/models/images/aiuta_history_image.dart';
import 'package:aiuta_flutter/models/product/aiuta_product.dart';
import 'package:aiuta_flutter/src/platform/aiutasdk_platform_interface.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

class MethodChannelAiuta extends AiutaPlatform {
  @visibleForTesting
  final methodChannel = const MethodChannel('aiutasdk');

  final aiutaActionsChannel = const EventChannel('aiutaActionsHandler');
  final aiutaAnalyticChannel = const EventChannel('aiutaAnalyticHandler');
  final aiutaJWTAuthActionsChannel = const EventChannel('aiutaJWTAuthHandler');
  final aiutaDataActionsChannel = const EventChannel('aiutaDataActionsHandler');

  @override
  Future<void> configure({required AiutaConfiguration configuration}) {
    return methodChannel.invokeMethod(
      'configure',
      {
        "configuration": jsonEncode(configuration),
      },
    );
  }

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
  Future<void> startHistoryFlow({
    required AiutaConfiguration configuration,
  }) {
    return methodChannel.invokeMethod(
      'startHistoryFlow',
      {
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
  Stream<String> observeAiutaAnalytic() {
    return aiutaAnalyticChannel
        .receiveBroadcastStream()
        .map((event) => event.toString());
  }

  @override
  Stream<String> observeAiutaJWTAuthActions() {
    return aiutaJWTAuthActionsChannel
        .receiveBroadcastStream()
        .map((event) => event.toString());
  }

  @override
  Stream<String> observeAiutaDataActions() {
    return aiutaDataActionsChannel
        .receiveBroadcastStream()
        .map((event) => event.toString());
  }

  @override
  Future<void> updateUserConsent({required bool isUserConsentObtained}) {
    return methodChannel.invokeMethod(
      'updateUserConsent',
      {
        "isUserConsentObtained": isUserConsentObtained,
      },
    );
  }

  @override
  Future<void> updateUploadedImages({
    required List<AiutaUploadedImage> uploadedImages,
  }) {
    return methodChannel.invokeMethod(
      'updateUploadedImages',
      {
        "uploadedImages": jsonEncode(uploadedImages),
      },
    );
  }

  @override
  Future<void> updateGeneratedImages({
    required List<AiutaGeneratedImage> generatedImages,
  }) {
    return methodChannel.invokeMethod(
      'updateGeneratedImages',
      {
        "generatedImages": jsonEncode(generatedImages),
      },
    );
  }
}
