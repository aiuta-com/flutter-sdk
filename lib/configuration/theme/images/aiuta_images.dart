import 'package:aiuta_flutter/configuration/theme/images/aiuta_onboarding_images.dart';
import 'package:json_annotation/json_annotation.dart';

part 'aiuta_images.g.dart';

@JsonSerializable()
class AiutaImages {
  // Pre onboarding
  /// Background image path for pre onboarding screen.
  final String? preonboardingImagePath;

  // Onboarding
  final AiutaOnboardingImages? onboardingImages;

  // Selector screen
  /// Image for empty state on selector screen
  final String? selectorEmptyImagePath;

  // Result screen
  /// Feedback image of giving feedback from user (like icon, for instance)
  final String? feedbackThanksImagePath;

  AiutaImages({
    this.preonboardingImagePath,
    this.onboardingImages,
    this.selectorEmptyImagePath,
    this.feedbackThanksImagePath,
  });

  // Json staff
  factory AiutaImages.fromJson(Map<String, dynamic> json) =>
      _$AiutaImagesFromJson(json);

  Map<String, dynamic> toJson() => _$AiutaImagesToJson(this);
}
