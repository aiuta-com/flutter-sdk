import 'dart:ffi';

import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'fashionsdk_method_channel.dart';

abstract class FashionsdkPlatform extends PlatformInterface {
  /// Constructs a FashionsdkPlatform.
  FashionsdkPlatform() : super(token: _token);

  static final Object _token = Object();

  static FashionsdkPlatform _instance = MethodChannelFashionsdk();

  /// The default instance of [FashionsdkPlatform] to use.
  ///
  /// Defaults to [MethodChannelFashionsdk].
  static FashionsdkPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [FashionsdkPlatform] when
  /// they register themselves.
  static set instance(FashionsdkPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }

  Future<void> startAiutaFlow() {
    throw UnimplementedError('startAiutaFlow() has not been implemented.');
  }

  Future<void> startAiutaBottomSheetFlow() {
    throw UnimplementedError('startAiutaBottomSheetFlow() has not been implemented.');
  }

  Future<void> startAiutaShareAssetFlow() {
    throw UnimplementedError('startAiutaShareAssetFlow() has not been implemented.');
  }

  Stream<String> observeAiutaEvent() {
    throw UnimplementedError('observeAiutaEvent() has not been implemented.');
  }
}
