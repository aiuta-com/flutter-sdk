// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'aiuta_theme.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AiutaTheme _$AiutaThemeFromJson(Map<String, dynamic> json) => AiutaTheme(
      colors: json['colors'] == null
          ? null
          : AiutaColors.fromJson(json['colors'] as Map<String, dynamic>),
      gradients: json['gradients'] == null
          ? null
          : AiutaGradients.fromJson(json['gradients'] as Map<String, dynamic>),
      typography: json['typography'] == null
          ? null
          : AiutaTypography.fromJson(
              json['typography'] as Map<String, dynamic>),
      icons: json['icons'] == null
          ? null
          : AiutaIcons.fromJson(json['icons'] as Map<String, dynamic>),
      shapes: json['shapes'] == null
          ? null
          : AiutaShapes.fromJson(json['shapes'] as Map<String, dynamic>),
      dimensions: json['dimensions'] == null
          ? null
          : AiutaDimensions.fromJson(
              json['dimensions'] as Map<String, dynamic>),
      watermark: json['watermark'] == null
          ? null
          : AiutaWatermark.fromJson(json['watermark'] as Map<String, dynamic>),
      images: json['images'] == null
          ? null
          : AiutaImages.fromJson(json['images'] as Map<String, dynamic>),
      toggles: json['toggles'] == null
          ? null
          : AiutaThemeToggles.fromJson(json['toggles'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AiutaThemeToJson(AiutaTheme instance) =>
    <String, dynamic>{
      'colors': instance.colors,
      'gradients': instance.gradients,
      'typography': instance.typography,
      'icons': instance.icons,
      'shapes': instance.shapes,
      'dimensions': instance.dimensions,
      'watermark': instance.watermark,
      'images': instance.images,
      'toggles': instance.toggles,
    };
