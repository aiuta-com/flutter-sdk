import 'package:aiutasdk/configuration/AiutaConfiguration.dart';
import 'fashionsdk_platform_interface.dart';

class Aiuta {
  AiutaConfiguration configuration;

  Aiuta({required this.configuration});

  Future<void> startAiutaFlow() {
    return AiutaPlatform.instance.startAiutaFlow();
  }

  Future<void> startAiutaBottomSheetFlow() {
    return AiutaPlatform.instance.startAiutaBottomSheetFlow();
  }

  Future<void> startAiutaShareAssetFlow() {
    return AiutaPlatform.instance.startAiutaShareAssetFlow();
  }

  Stream<String> observeAiutaEvent() {
    return AiutaPlatform.instance.observeAiutaEvent();
  }
}
