import 'package:json_annotation/json_annotation.dart';

part 'aiuta_shapes.g.dart';

@JsonSerializable()
class AiutaShapes {
  // Images
  final int mainImage;
  final int onboardingImage;
  final int previewImage;

  // Bottom sheet
  final int bottomSheet;

  // Buttons
  final int buttonL;
  final int buttonM;

  AiutaShapes({
    // Images
    required this.mainImage,
    required this.onboardingImage,
    required this.previewImage,
    // Bottom sheet
    required this.bottomSheet,
    // Buttons
    required this.buttonL,
    required this.buttonM,
  });

  // Json staff
  factory AiutaShapes.fromJson(Map<String, dynamic> json) =>
      _$AiutaShapesFromJson(json);

  Map<String, dynamic> toJson() => _$AiutaShapesToJson(this);
}
