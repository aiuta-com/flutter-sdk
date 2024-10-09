import 'package:json_annotation/json_annotation.dart';

part 'AiutaImages.g.dart';

@JsonSerializable()
class AiutaImages {
  // Pre onboarding
  final String? preonboardingImagePath;

  AiutaImages({this.preonboardingImagePath});

  // Json staff
  factory AiutaImages.fromJson(Map<String, dynamic> json) =>
      _$AiutaImagesFromJson(json);

  Map<String, dynamic> toJson() => _$AiutaImagesToJson(this);
}
