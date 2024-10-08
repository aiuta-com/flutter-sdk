import 'package:aiutasdk/configuration/AiutaConfiguration.dart';
import 'fashionsdk_platform_interface.dart';

class Aiuta {
  AiutaConfiguration configuration;

  Aiuta({required this.configuration});

  Future<void> startAiutaFlow() {
    return FashionsdkPlatform.instance.startAiutaFlow();
  }

  Future<void> startAiutaBottomSheetFlow() {
    return FashionsdkPlatform.instance.startAiutaBottomSheetFlow();
  }

  Future<void> startAiutaShareAssetFlow() {
    return FashionsdkPlatform.instance.startAiutaShareAssetFlow();
  }

  Stream<String> observeAiutaEvent() {
    return FashionsdkPlatform.instance.observeAiutaEvent();
  }
}
