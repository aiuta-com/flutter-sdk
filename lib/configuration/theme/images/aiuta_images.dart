import 'package:json_annotation/json_annotation.dart';

part 'aiuta_images.g.dart';

@JsonSerializable()
class AiutaImages {
  // Pre onboarding
  /// Background image path for pre onboarding screen.
  final String preonboardingImagePath;

  AiutaImages({required this.preonboardingImagePath});

  // Json staff
  factory AiutaImages.fromJson(Map<String, dynamic> json) =>
      _$AiutaImagesFromJson(json);

  Map<String, dynamic> toJson() => _$AiutaImagesToJson(this);
}
