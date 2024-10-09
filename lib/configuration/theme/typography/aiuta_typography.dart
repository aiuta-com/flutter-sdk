import 'package:aiutasdk/configuration/theme/typography/aiuta_font.dart';
import 'package:json_annotation/json_annotation.dart';

part 'aiuta_typography.g.dart';

@JsonSerializable()
class AiutaTypography {
  final AiutaFont titleXL;
  final AiutaFont welcomeText;
  final AiutaFont titleL;
  final AiutaFont titleM;
  final AiutaFont navbar;
  final AiutaFont regular;
  final AiutaFont button;
  final AiutaFont smallButton;
  final AiutaFont cells;
  final AiutaFont chips;
  final AiutaFont productName;
  final AiutaFont price;
  final AiutaFont brandName;
  final AiutaFont description;

  AiutaTypography({
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
