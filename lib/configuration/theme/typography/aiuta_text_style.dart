import 'package:aiuta_flutter/configuration/theme/typography/aiuta_font_weight.dart';
import 'package:json_annotation/json_annotation.dart';

part 'aiuta_text_style.g.dart';

@JsonSerializable()
class AiutaTextStyle {
  final String fontFamily;
  final double fontSize;
  final AiutaFontWeight fontWeight;
  final double letterSpacing;
  final double lineHeight;

  AiutaTextStyle({
    required this.fontFamily,
    required this.fontSize,
    required this.fontWeight,
    required this.letterSpacing,
    required this.lineHeight,
  });

  // Json staff
  factory AiutaTextStyle.fromJson(Map<String, dynamic> json) =>
      _$AiutaTextStyleFromJson(json);

  Map<String, dynamic> toJson() => _$AiutaTextStyleToJson(this);
}
