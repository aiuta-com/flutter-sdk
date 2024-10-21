/// Exception thrown when the authentication is not valid.
class NotValidAuthenticationException implements Exception {
  /// The cause of the exception.
  String cause;

  /// Create a new instance of NotValidAuthenticationException.
  NotValidAuthenticationException(this.cause);
}
