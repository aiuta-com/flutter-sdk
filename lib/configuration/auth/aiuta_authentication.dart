import 'package:aiuta_flutter/configuration/auth/aiuta_authentication_mode.dart';
import 'package:aiuta_flutter/utils/null_utils.dart';
import 'package:json_annotation/json_annotation.dart';

part 'aiuta_authentication.g.dart';

sealed class AiutaAuthentication {
  AiutaAuthenticationMode mode;

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

  @override
  Map<String, dynamic> toJson() => _$ApiKeyAuthenticationToJson(this);
}

@JsonSerializable()
class JWTAuthentication extends AiutaAuthentication {
  final String subscriptionId;

  // Ignore this in json
  @JsonKey(toJson: toNull, fromJson: toNull, includeIfNull: false)
  final Future<String> Function(String?) getJWT;

  JWTAuthentication({required this.subscriptionId, required this.getJWT})
      : super(AiutaAuthenticationMode.jwt);

  // Json staff
  factory JWTAuthentication.fromJson(Map<String, dynamic> json) =>
      _$JWTAuthenticationFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$JWTAuthenticationToJson(this);
}
