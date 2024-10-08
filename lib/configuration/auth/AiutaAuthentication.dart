import 'dart:convert';

import 'package:aiutasdk/configuration/auth/AiutaAuthenticationMode.dart';
import 'package:aiutasdk/utils/NullUtils.dart';
import 'package:json_annotation/json_annotation.dart';

part 'AiutaAuthentication.g.dart';

sealed class AiutaAuthentication {
  final AiutaAuthenticationMode mode;

  AiutaAuthentication(this.mode);

  // Json staff
  factory AiutaAuthentication.fromJson(Map<String, dynamic> json) {
    switch (json['mode'] as String) {
      case 'apiKey':
        return ApiKeyAuthentication.fromJson(json);
      case 'jwt':
        return JWTAuthentication.fromJson(json);
      default:
        throw Exception('Unknown authentication type');
    }
  }

  Map<String, dynamic> toJson();
}

@JsonSerializable()
class ApiKeyAuthentication extends AiutaAuthentication {
  final String subscriptionId;
  final String apiKey;

  ApiKeyAuthentication({required this.subscriptionId, required this.apiKey})
      : super(AiutaAuthenticationMode.apiKey);

  // Json staff
  factory ApiKeyAuthentication.fromJson(Map<String, dynamic> json) =>
      _$ApiKeyAuthenticationFromJson(json);

  Map<String, dynamic> toJson() => _$ApiKeyAuthenticationToJson(this);
}

@JsonSerializable()
class JWTAuthentication extends AiutaAuthentication {
  final String subscriptionId;

  // Ignore this in json
  @JsonKey(toJson: toNull, fromJson: toNull, includeIfNull: false)
  final Future<String> Function(String) getJWT;

  JWTAuthentication({required this.subscriptionId, required this.getJWT})
      : super(AiutaAuthenticationMode.jwt);

  // Json staff
  factory JWTAuthentication.fromJson(Map<String, dynamic> json) =>
      _$JWTAuthenticationFromJson(json);

  Map<String, dynamic> toJson() => _$JWTAuthenticationToJson(this);
}
