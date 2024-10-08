// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'AiutaAuthentication.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ApiKeyAuthentication _$ApiKeyAuthenticationFromJson(
        Map<String, dynamic> json) =>
    ApiKeyAuthentication(
      subscriptionId: json['subscriptionId'] as String,
      apiKey: json['apiKey'] as String,
    );

Map<String, dynamic> _$ApiKeyAuthenticationToJson(
        ApiKeyAuthentication instance) =>
    <String, dynamic>{
      'subscriptionId': instance.subscriptionId,
      'apiKey': instance.apiKey,
    };

JWTAuthentication _$JWTAuthenticationFromJson(Map<String, dynamic> json) =>
    JWTAuthentication(
      subscriptionId: json['subscriptionId'] as String,
      getJWT: toNull(json['getJWT']),
    );

Map<String, dynamic> _$JWTAuthenticationToJson(JWTAuthentication instance) {
  final val = <String, dynamic>{
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
