import 'package:aiutasdk/configuration/theme/colors/aiuta_colors.dart';
import 'package:aiutasdk/configuration/theme/gradients/aiuta_gradients.dart';
import 'package:aiutasdk/configuration/theme/icons/aiuta_icons.dart';
import 'package:aiutasdk/configuration/theme/shapes/aiuta_shapes.dart';
import 'package:aiutasdk/configuration/theme/typography/aiuta_typography.dart';
import 'package:aiutasdk/configuration/theme/watermark/aiuta_watermark.dart';
import 'package:json_annotation/json_annotation.dart';

part 'aiuta_theme.g.dart';

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
