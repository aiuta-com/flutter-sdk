import 'package:aiutasdk/configuration/aiuta_configuration.dart';
import 'package:aiutasdk/models/aiuta_product.dart';
import 'package:aiutasdk/platform/fashionsdk_platform_interface.dart';

class Aiuta {
  AiutaConfiguration configuration;

  Aiuta({required this.configuration});

  Future<void> startAiutaFlow({required AiutaProduct product}) {
    return AiutaPlatform.instance.startAiutaFlow(
      product: product,
      configuration: configuration,
    );
  }

  Stream<String> observeAiutaEvent() {
    return AiutaPlatform.instance.observeAiutaEvent();
  }
}
