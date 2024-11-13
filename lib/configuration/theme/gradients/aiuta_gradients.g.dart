// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'aiuta_gradients.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AiutaGradients _$AiutaGradientsFromJson(Map<String, dynamic> json) =>
    AiutaGradients(
      loadingAnimation: (json['loadingAnimation'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      tryOnButtonBackground: (json['tryOnButtonBackground'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$AiutaGradientsToJson(AiutaGradients instance) =>
    <String, dynamic>{
      'loadingAnimation': instance.loadingAnimation,
      'tryOnButtonBackground': instance.tryOnButtonBackground,
    };
