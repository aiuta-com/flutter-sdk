import 'package:aiuta_flutter/configuration/theme/colors/aiuta_colors.dart';
import 'package:aiuta_flutter/configuration/theme/dimensions/aiuta_dimensions.dart';
import 'package:aiuta_flutter/configuration/theme/gradients/aiuta_gradients.dart';
import 'package:aiuta_flutter/configuration/theme/icons/aiuta_icons.dart';
import 'package:aiuta_flutter/configuration/theme/images/aiuta_images.dart';
import 'package:aiuta_flutter/configuration/theme/shapes/aiuta_shapes.dart';
import 'package:aiuta_flutter/configuration/theme/toggles/aiuta_theme_toggles.dart';
import 'package:aiuta_flutter/configuration/theme/typography/aiuta_typography.dart';
import 'package:aiuta_flutter/configuration/theme/watermark/aiuta_watermark.dart';
import 'package:json_annotation/json_annotation.dart';

part 'aiuta_theme.g.dart';

@JsonSerializable()
class AiutaTheme {
  final AiutaColors? colors;
  final AiutaGradients? gradients;
  final AiutaTypography? typography;
  final AiutaIcons? icons;
  final AiutaShapes? shapes;
  final AiutaDimensions? dimensions;
  final AiutaWatermark? watermark;
  final AiutaImages? images;
  final AiutaThemeToggles? toggles;

  AiutaTheme({
    this.colors,
    this.gradients,
    this.typography,
    this.icons,
    this.shapes,
    this.dimensions,
    this.watermark,
    this.images,
    this.toggles,
  });

  // Json staff
  factory AiutaTheme.fromJson(Map<String, dynamic> json) =>
      _$AiutaThemeFromJson(json);

  Map<String, dynamic> toJson() => _$AiutaThemeToJson(this);
}
