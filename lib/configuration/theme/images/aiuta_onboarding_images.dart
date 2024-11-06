import 'package:json_annotation/json_annotation.dart';

part 'aiuta_onboarding_images.g.dart';

@JsonSerializable()
class AiutaOnboardingImages {
  // Try on
  /// Main image on Try On step (1 substep)
  final String? onboardingTryOnMainImage1Path;

  /// Main image on Try On step (2 substep)
  final String? onboardingTryOnMainImage2Path;

  /// Main image on Try On step (3 substep)
  final String? onboardingTryOnMainImage3Path;

  /// Item image on Try On step (1 substep)
  final String? onboardingTryOnItemImage1Path;

  /// Item image on Try On step (2 substep)
  final String? onboardingTryOnItemImage2Path;

  /// Item image on Try On step (3 substep)
  final String? onboardingTryOnItemImage3Path;

  // Best result
  /// Example of bad image on Best result step (left)
  final String? onboardingBestResulBadImage1Path;

  /// Example of bad image on Best result step (right)
  final String? onboardingBestResulBadImage2Path;

  /// Example of good image on Best result step (left)
  final String? onboardingBestResulGoodImage1Path;

  /// Example of good image on Best result step (right)
  final String? onboardingBestResulGoodImage2Path;

  AiutaOnboardingImages({
    required this.onboardingTryOnMainImage1Path,
    required this.onboardingTryOnMainImage2Path,
    required this.onboardingTryOnMainImage3Path,
    required this.onboardingTryOnItemImage1Path,
    required this.onboardingTryOnItemImage2Path,
    required this.onboardingTryOnItemImage3Path,
    required this.onboardingBestResulBadImage1Path,
    required this.onboardingBestResulBadImage2Path,
    required this.onboardingBestResulGoodImage1Path,
    required this.onboardingBestResulGoodImage2Path,
  });

  // Json staff
  factory AiutaOnboardingImages.fromJson(Map<String, dynamic> json) =>
      _$AiutaOnboardingImagesFromJson(json);

  Map<String, dynamic> toJson() => _$AiutaOnboardingImagesToJson(this);
}
