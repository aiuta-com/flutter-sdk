import 'package:aiutasdk/configuration/theme/typography/aiuta_font_weight.dart';
import 'package:json_annotation/json_annotation.dart';

part 'aiuta_font.g.dart';

@JsonSerializable()
class AiutaFont {
  final String fontFamily;
  final double fontSize;
  final AiutaFontWeight fontWeight;
  final double letterSpacing;
  final double lineHeight;
  final String ttfPath;

  AiutaFont({
    required this.fontFamily,
    required this.fontSize,
    required this.fontWeight,
    required this.letterSpacing,
    required this.lineHeight,
    required this.ttfPath,
  });

  // Json staff
  factory AiutaFont.fromJson(Map<String, dynamic> json) =>
      _$AiutaFontFromJson(json);

  Map<String, dynamic> toJson() => _$AiutaFontToJson(this);
}
