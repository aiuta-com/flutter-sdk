import 'package:aiuta_flutter/models/consent/aiuta_supplementary_consent.dart';
import 'package:aiuta_flutter/models/images/aiuta_history_image.dart';

/// Listeners for various data events in the Aiuta SDK.
/// Should be used to listen to data events such as user consent change, image
/// upload, image generation, etc. when custom [AiutaDataProvider] is used.
class AiutaDataListeners {
  /// User has given consent to use the Aiuta SDK and pressed the "Start" button.
  final Future<void> Function(List<AiutaSupplementaryConsent>)
      obtainUserConsent;

  /// User has uploaded new images to the Aiuta SDK.
  /// You should prepend the new images to the existing list of uploaded images.
  /// That's way to show the user the most recent uploaded images first.
  final Future<void> Function(List<AiutaHistoryImage>) addUploadedImages;

  /// User has selected a previously uploaded image to start virtual try-on.
  /// You should move the selected image to the beginning of the list of uploaded images.
  /// That's way to show the user the most recently used image first.
  final Future<void> Function(AiutaHistoryImage) selectUploadedImage;

  /// User has deleted images from the Aiuta SDK.
  final Future<void> Function(List<AiutaHistoryImage>) deleteUploadedImages;

  /// Aiuta has generated new images.
  final Future<void> Function(String, List<AiutaHistoryImage>)
      addGeneratedImages;

  /// User has deleted generated images from the history.
  final Future<void> Function(List<AiutaHistoryImage>) deleteGeneratedImages;

  /// Create a new instance of AiutaDataListeners.
  AiutaDataListeners({
    required this.obtainUserConsent,
    required this.addUploadedImages,
    required this.selectUploadedImage,
    required this.deleteUploadedImages,
    required this.addGeneratedImages,
    required this.deleteGeneratedImages,
  });
}
