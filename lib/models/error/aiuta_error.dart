import 'package:aiuta_flutter/models/error/aiuta_error_type.dart';
import 'package:json_annotation/json_annotation.dart';

part 'aiuta_error.g.dart';

/// Wrapper for native error
@JsonSerializable()
class AiutaError {
  final AiutaErrorType errorType;

  AiutaError({
    required AiutaErrorType this.errorType,
  });

  // Json staff
  /// Creates a page view event from a JSON object.
  factory AiutaError.fromJson(Map<String, dynamic> json) =>
      _$AiutaErrorFromJson(json);

  /// Converts the page view event to a JSON object.
  Map<String, dynamic> toJson() => _$AiutaErrorToJson(this);
}
