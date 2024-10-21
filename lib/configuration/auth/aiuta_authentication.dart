import 'package:aiuta_flutter/configuration/auth/aiuta_authentication_mode.dart';
import 'package:aiuta_flutter/src/utils/null_utils.dart';
import 'package:json_annotation/json_annotation.dart';

part 'aiuta_authentication.g.dart';

/// Base class for Aiuta authentication.
/// This class is used to authenticate Aiuta to use digital try-on API with your credentials.
/// Supported authentication methods are ApiKey and JWT.
sealed class AiutaAuthentication {
  /// Authentication mode is used to determine the type of authentication.
  AiutaAuthenticationMode mode;

  /// Base constructor for AiutaAuthentication.
  AiutaAuthentication(this.mode);

  // Json staff
  /// Factory method to create AiutaAuthentication from json.
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

  /// Method to convert AiutaAuthentication to json.
  Map<String, dynamic> toJson();
}

/// ApiKey authentication.
/// This class is used to authenticate Aiuta using ApiKey.
/// Please see [Aiuta API documentation](https://developer.aiuta.com/docs/start) for instructions on how to get your API key.
@JsonSerializable()
class ApiKeyAuthentication extends AiutaAuthentication {
  /// Subscription id is used to authenticate insecure requests.
  final String subscriptionId;

  /// ApiKey is used to authenticate secure requests.
  final String apiKey;

  /// Create ApiKeyAuthentication with subscription id and api key.
  ApiKeyAuthentication({required this.subscriptionId, required this.apiKey})
      : super(AiutaAuthenticationMode.apiKey);

  // Json staff
  /// Factory method to create ApiKeyAuthentication from json.
  factory ApiKeyAuthentication.fromJson(Map<String, dynamic> json) =>
      _$ApiKeyAuthenticationFromJson(json);

  @override

  /// Method to convert ApiKeyAuthentication to json.
  Map<String, dynamic> toJson() => _$ApiKeyAuthenticationToJson(this);
}

/// JWT authentication.
/// This class is used to authenticate Aiuta using JWT.
/// JWT is used to authenticate sensitive requests (such as starting virtual try-on).
/// Other requests are authenticated with your subscription id.
/// Please see [Aiuta API documentation](https://developer.aiuta.com/docs/start) for instructions on how to get your subscription id.
@JsonSerializable()
class JWTAuthentication extends AiutaAuthentication {
  /// Subscription id is used to authenticate insecure requests.
  final String subscriptionId;

  /// The function is used to get JWT for sensitive requests.
  /// The function should return a JWT string that is not empty, a JWT is not expired or invalid.
  /// Otherwise, the request will be rejected and the user will be notified with "Something went wrong" message during virtual try-on.
  @JsonKey(toJson: toNull, fromJson: toNull, includeIfNull: false)
  final Future<String> Function(String?) getJWT;

  /// Create JWTAuthentication with subscription id and getJWT function.
  JWTAuthentication({required this.subscriptionId, required this.getJWT})
      : super(AiutaAuthenticationMode.jwt);

  // Json staff
  /// Factory method to create JWTAuthentication from json.
  factory JWTAuthentication.fromJson(Map<String, dynamic> json) =>
      _$JWTAuthenticationFromJson(json);

  @override
  /// Method to convert JWTAuthentication to json.
  Map<String, dynamic> toJson() => _$JWTAuthenticationToJson(this);
}
