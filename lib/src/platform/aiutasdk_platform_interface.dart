import 'package:aiuta_flutter/configuration/aiuta_configuration.dart';
import 'package:aiuta_flutter/models/error/aiuta_error.dart';
import 'package:aiuta_flutter/models/images/aiuta_history_image.dart';
import 'package:aiuta_flutter/models/product/aiuta_product.dart';
import 'package:aiuta_flutter/src/platform/aiutasdk_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

abstract class AiutaPlatform extends PlatformInterface {
  /// Constructs a AiutaPlatform.
  AiutaPlatform() : super(token: _token);

  static final Object _token = Object();

  static AiutaPlatform _instance = MethodChannelAiuta();

  /// The default instance of [AiutaPlatform] to use.
  ///
  /// Defaults to [MethodChannelAiuta].
  static AiutaPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [AiutaPlatform] when
  /// they register themselves.
  static set instance(AiutaPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<void> testAvailability() {
    throw UnimplementedError(
      'testAvailability() has not been implemented.',
    );
  }

  Future<bool?> isForeground() {
    throw UnimplementedError(
      'isForeground() has not been implemented.',
    );
  }

  Future<void> configure({
    required AiutaConfiguration configuration,
  }) {
    throw UnimplementedError(
      'configure() has not been implemented.',
    );
  }

  Future<void> startAiutaFlow({
    required AiutaProduct product,
    required AiutaConfiguration configuration,
  }) {
    throw UnimplementedError(
      'startAiutaFlow() has not been implemented.',
    );
  }

  Future<void> startHistoryFlow({
    required AiutaConfiguration configuration,
  }) {
    throw UnimplementedError(
      'startHistoryFlow() has not been implemented.',
    );
  }

  Future<void> updateActiveAiutaProduct({
    required AiutaProduct updatedAiutaProduct,
  }) {
    throw UnimplementedError(
      'updateActiveAiutaProduct() has not been implemented.',
    );
  }

  Future<void> resolveJWTAuth({required String newJWT}) {
    throw UnimplementedError(
      'resolveJWTAuth() has not been implemented.',
    );
  }

  Stream<String> observeAiutaActions() {
    throw UnimplementedError(
      'observeAiutaActions() has not been implemented.',
    );
  }

  Stream<String> observeAiutaAnalytic() {
    throw UnimplementedError(
      'observeAiutaAnalytic() has not been implemented.',
    );
  }

  Stream<String> observeAiutaJWTAuthActions() {
    throw UnimplementedError(
      'observeAiutaJWTAuthActions() has not been implemented.',
    );
  }

  Stream<String> observeAiutaDataActions() {
    throw UnimplementedError(
      'observeAiutaDataActions() has not been implemented.',
    );
  }

  Future<void> updateUserConsent({
    required bool isUserConsentObtained,
  }) {
    throw UnimplementedError(
      'updateUserConsent() has not been implemented.',
    );
  }

  Future<void> updateUploadedImages({
    required List<AiutaHistoryImage> uploadedImages,
  }) {
    throw UnimplementedError(
      'updateActiveUploadedImages() has not been implemented.',
    );
  }

  Future<void> updateGeneratedImages({
    required List<AiutaHistoryImage> generatedImages,
  }) {
    throw UnimplementedError(
      'updateGeneratedImages() has not been implemented.',
    );
  }

  Future<void> notifyAboutError({
    required AiutaError error,
  }) {
    throw UnimplementedError(
      'notifyAboutError() has not been implemented.',
    );
  }
}
