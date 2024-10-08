
import 'dart:ffi';

import 'fashionsdk_platform_interface.dart';

class Fashionsdk {

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
