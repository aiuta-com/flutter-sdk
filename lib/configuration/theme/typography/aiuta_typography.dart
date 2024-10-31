import 'package:aiuta_flutter/configuration/theme/typography/aiuta_font.dart';
import 'package:aiuta_flutter/configuration/theme/typography/aiuta_text_style.dart';
import 'package:json_annotation/json_annotation.dart';

part 'aiuta_typography.g.dart';

@JsonSerializable()
class AiutaTypography {
  final List<AiutaFont> familyFonts;
  final AiutaTextStyle titleXL;
  final AiutaTextStyle welcomeText;
  final AiutaTextStyle titleL;
  final AiutaTextStyle titleM;
  final AiutaTextStyle navbar;
  final AiutaTextStyle regular;
  final AiutaTextStyle button;
  final AiutaTextStyle smallButton;
  final AiutaTextStyle cells;
  final AiutaTextStyle chips;
  final AiutaTextStyle productName;
  final AiutaTextStyle price;
  final AiutaTextStyle brandName;
  final AiutaTextStyle description;

  AiutaTypography({
    required this.familyFonts,
    required this.titleXL,
    required this.welcomeText,
    required this.titleL,
    required this.titleM,
    required this.navbar,
    required this.regular,
    required this.button,
    required this.smallButton,
    required this.cells,
    required this.chips,
    required this.productName,
    required this.price,
    required this.brandName,
    required this.description,
  });

  // Json staff
  factory AiutaTypography.fromJson(Map<String, dynamic> json) =>
      _$AiutaTypographyFromJson(json);

  Map<String, dynamic> toJson() => _$AiutaTypographyToJson(this);
}
