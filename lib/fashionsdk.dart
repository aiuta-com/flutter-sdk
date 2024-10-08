import 'package:aiutasdk/configuration/AiutaConfiguration.dart';
import 'package:aiutasdk/models/AiutaSKUItem.dart';
import 'package:aiutasdk/platform/fashionsdk_platform_interface.dart';

class Aiuta {
  AiutaConfiguration configuration;

  Aiuta({required this.configuration});

  Future<void> startAiutaFlow({required AiutaSKUItem skuItem}) {
    return AiutaPlatform.instance.startAiutaFlow(
      skuItem: skuItem,
      configuration: configuration,
    );
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
