// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'aiuta_configuration.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AiutaConfiguration _$AiutaConfigurationFromJson(Map<String, dynamic> json) =>
    AiutaConfiguration(
      mode: $enumDecode(_$AiutaModeEnumMap, json['mode']),
      authentication: AiutaAuthentication.fromJson(
          json['authentication'] as Map<String, dynamic>),
      toggles: AiutaToggles.fromJson(json['toggles'] as Map<String, dynamic>),
      language:
          AiutaLanguage.fromJson(json['language'] as Map<String, dynamic>),
      listeners: toNull(json['listeners']),
      dimensions: json['dimensions'] == null
          ? null
          : AiutaDimensions.fromJson(
              json['dimensions'] as Map<String, dynamic>),
      theme: json['theme'] == null
          ? null
          : AiutaTheme.fromJson(json['theme'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AiutaConfigurationToJson(AiutaConfiguration instance) {
  final val = <String, dynamic>{
    'mode': _$AiutaModeEnumMap[instance.mode]!,
    'authentication': instance.authentication,
    'dimensions': instance.dimensions,
    'toggles': instance.toggles,
    'language': instance.language,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('listeners', toNull(instance.listeners));
  val['theme'] = instance.theme;
  return val;
}

const _$AiutaModeEnumMap = {
  AiutaMode.fullScreen: 'fullScreen',
  AiutaMode.bottomSheet: 'bottomSheet',
  AiutaMode.pageSheet: 'pageSheet',
};
