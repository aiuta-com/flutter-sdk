// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'aiuta_shapes.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AiutaShapes _$AiutaShapesFromJson(Map<String, dynamic> json) => AiutaShapes(
      mainImage: (json['mainImage'] as num).toInt(),
      onboardingImage: (json['onboardingImage'] as num).toInt(),
      previewImage: (json['previewImage'] as num).toInt(),
      bottomSheet: (json['bottomSheet'] as num).toInt(),
      buttonL: (json['buttonL'] as num).toInt(),
      buttonM: (json['buttonM'] as num).toInt(),
    );

Map<String, dynamic> _$AiutaShapesToJson(AiutaShapes instance) =>
    <String, dynamic>{
      'mainImage': instance.mainImage,
      'onboardingImage': instance.onboardingImage,
      'previewImage': instance.previewImage,
      'bottomSheet': instance.bottomSheet,
      'buttonL': instance.buttonL,
      'buttonM': instance.buttonM,
    };
