import 'package:aiuta_flutter/configuration/theme/typography/aiuta_font_weight.dart';
import 'package:json_annotation/json_annotation.dart';

part 'aiuta_font.g.dart';

@JsonSerializable()
class AiutaFont {
  final String filePath;
  final String family;
  final AiutaFontWeight weight;

  AiutaFont({
    required this.filePath,
    required this.family,
    required this.weight,
  });

  // Json staff
  factory AiutaFont.fromJson(Map<String, dynamic> json) =>
      _$AiutaFontFromJson(json);

  Map<String, dynamic> toJson() => _$AiutaFontToJson(this);
}
