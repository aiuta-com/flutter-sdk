sealed class AiutaAuthentication {
  String get subscriptionId;
  set subscriptionId(String subscriptionId);
}

class ApiKeyAuthentication extends AiutaAuthentication {
  @override
  String subscriptionId;
  final String apiKey;

  ApiKeyAuthentication({required this.subscriptionId, required this.apiKey});
}

class JWTAuthentication extends AiutaAuthentication {
  @override
  String subscriptionId;
  final Future<String> Function(String) getJWT;

  JWTAuthentication({required this.subscriptionId, required this.getJWT});
}
