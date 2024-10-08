// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'AiutaFont.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AiutaFont _$AiutaFontFromJson(Map<String, dynamic> json) => AiutaFont(
      path: json['path'] as String,
      weight: $enumDecode(_$AiutaFontWeightEnumMap, json['weight']),
    );

Map<String, dynamic> _$AiutaFontToJson(AiutaFont instance) => <String, dynamic>{
      'path': instance.path,
      'weight': _$AiutaFontWeightEnumMap[instance.weight]!,
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
