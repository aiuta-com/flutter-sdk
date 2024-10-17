// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'aiuta_history_image.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AiutaUploadedImage _$AiutaUploadedImageFromJson(Map<String, dynamic> json) =>
    AiutaUploadedImage(
      id: json['id'] as String,
      url: json['url'] as String,
    );

Map<String, dynamic> _$AiutaUploadedImageToJson(AiutaUploadedImage instance) =>
    <String, dynamic>{
      'url': instance.url,
      'id': instance.id,
    };

AiutaGeneratedImage _$AiutaGeneratedImageFromJson(Map<String, dynamic> json) =>
    AiutaGeneratedImage(
      url: json['url'] as String,
    );

Map<String, dynamic> _$AiutaGeneratedImageToJson(
        AiutaGeneratedImage instance) =>
    <String, dynamic>{
      'url': instance.url,
    };
