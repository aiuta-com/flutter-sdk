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

/// Theme configuration.
///
/// You can provide your own custom theme by creating a custom AiutaTheme providing your own fonts, colors, shapes, icons, etc.
@JsonSerializable()
class AiutaTheme {
  /// Colors configuration.
  final AiutaColors? colors;

  /// Gradients configuration.
  final AiutaGradients? gradients;

  /// Typography configuration.
  final AiutaTypography? typography;

  /// Icons configuration.
  final AiutaIcons? icons;

  /// Shapes configuration.
  final AiutaShapes? shapes;

  /// Dimensions configuration.
  final AiutaDimensions? dimensions;

  /// Watermark configuration.
  /// Watermark is a small logo that will be embedded on the bottom right corner of generated images when user shares them.
  final AiutaWatermark? watermark;

  /// Images configuration.
  final AiutaImages? images;

  /// Toggles some features of the Aiuta SDK appearance.
  final AiutaThemeToggles? toggles;

  /// Creates a new AiutaTheme instance.
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
  /// Creates a new AiutaTheme instance from a JSON object.
  factory AiutaTheme.fromJson(Map<String, dynamic> json) =>
      _$AiutaThemeFromJson(json);

  /// Converts this object to a JSON object.
  Map<String, dynamic> toJson() => _$AiutaThemeToJson(this);
}
