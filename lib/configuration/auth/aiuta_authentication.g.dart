// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'aiuta_authentication.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ApiKeyAuthentication _$ApiKeyAuthenticationFromJson(
        Map<String, dynamic> json) =>
    ApiKeyAuthentication(
      subscriptionId: json['subscriptionId'] as String,
      apiKey: json['apiKey'] as String,
    )..mode = $enumDecode(_$AiutaAuthenticationModeEnumMap, json['mode']);

Map<String, dynamic> _$ApiKeyAuthenticationToJson(
        ApiKeyAuthentication instance) =>
    <String, dynamic>{
      'mode': _$AiutaAuthenticationModeEnumMap[instance.mode]!,
      'subscriptionId': instance.subscriptionId,
      'apiKey': instance.apiKey,
    };

const _$AiutaAuthenticationModeEnumMap = {
  AiutaAuthenticationMode.apiKey: 'apiKey',
  AiutaAuthenticationMode.jwt: 'jwt',
};

JWTAuthentication _$JWTAuthenticationFromJson(Map<String, dynamic> json) =>
    JWTAuthentication(
      subscriptionId: json['subscriptionId'] as String,
      getJWT: toNull(json['getJWT']),
    )..mode = $enumDecode(_$AiutaAuthenticationModeEnumMap, json['mode']);

Map<String, dynamic> _$JWTAuthenticationToJson(JWTAuthentication instance) {
  final val = <String, dynamic>{
    'mode': _$AiutaAuthenticationModeEnumMap[instance.mode]!,
    'subscriptionId': instance.subscriptionId,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('getJWT', toNull(instance.getJWT));
  return val;
}
