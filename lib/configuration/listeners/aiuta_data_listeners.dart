import 'package:aiuta_flutter/models/images/aiuta_history_image.dart';

class AiutaDataListeners {
  final Future<void> Function() obtainUserConsent;
  final Future<void> Function(List<AiutaUploadedImage>) addUploadedImages;
  final Future<void> Function(AiutaUploadedImage) selectUploadedImage;
  final Future<void> Function(List<AiutaUploadedImage>) deleteUploadedImages;
  final Future<void> Function(List<AiutaGeneratedImage>) addGeneratedImages;
  final Future<void> Function(List<AiutaGeneratedImage>) deleteGeneratedImages;

  AiutaDataListeners({
    required this.obtainUserConsent,
    required this.addUploadedImages,
    required this.selectUploadedImage,
    required this.deleteUploadedImages,
    required this.addGeneratedImages,
    required this.deleteGeneratedImages,
  });
}
