import 'package:json_annotation/json_annotation.dart';

import 'colors/AiutaColors.dart';
import 'gradients/AiutaGradients.dart';
import 'icons/AiutaIcons.dart';
import 'shapes/AiutaShapes.dart';
import 'typography/AiutaTypography.dart';
import 'watermark/AiutaWatermark.dart';

part 'AiutaTheme.g.dart';

@JsonSerializable()
class AiutaTheme {
  final AiutaColors? colors;
  final AiutaGradients? gradients;
  final AiutaTypography? typography;
  final AiutaIcons? icons;
  final AiutaShapes? shapes;
  final AiutaWatermark? watermark;

  AiutaTheme({
    this.colors,
    this.gradients,
    this.typography,
    this.icons,
    this.shapes,
    this.watermark,
  });

  // Json staff
  factory AiutaTheme.fromJson(Map<String, dynamic> json) =>
      _$AiutaThemeFromJson(json);

  Map<String, dynamic> toJson() => _$AiutaThemeToJson(this);
}
