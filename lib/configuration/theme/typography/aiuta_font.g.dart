// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'aiuta_font.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AiutaFont _$AiutaFontFromJson(Map<String, dynamic> json) => AiutaFont(
      fontFamily: json['fontFamily'] as String,
      fontSize: (json['fontSize'] as num).toDouble(),
      fontWeight: $enumDecode(_$AiutaFontWeightEnumMap, json['fontWeight']),
      letterSpacing: (json['letterSpacing'] as num).toDouble(),
      lineHeight: (json['lineHeight'] as num).toDouble(),
      ttfPath: json['ttfPath'] as String,
    );

Map<String, dynamic> _$AiutaFontToJson(AiutaFont instance) => <String, dynamic>{
      'fontFamily': instance.fontFamily,
      'fontSize': instance.fontSize,
      'fontWeight': _$AiutaFontWeightEnumMap[instance.fontWeight]!,
      'letterSpacing': instance.letterSpacing,
      'lineHeight': instance.lineHeight,
      'ttfPath': instance.ttfPath,
    };

const _$AiutaFontWeightEnumMap = {
  AiutaFontWeight.thin: 'thin',
  AiutaFontWeight.extralight: 'extralight',
  AiutaFontWeight.light: 'light',
  AiutaFontWeight.normal: 'normal',
  AiutaFontWeight.medium: 'medium',
  AiutaFontWeight.semibold: 'semibold',
  AiutaFontWeight.bold: 'bold',
  AiutaFontWeight.extrabold: 'extrabold',
  AiutaFontWeight.black: 'black',
};
