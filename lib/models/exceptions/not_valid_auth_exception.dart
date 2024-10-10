class NotValidAuthenticationException implements Exception {
  String cause;

  NotValidAuthenticationException(this.cause);
}
