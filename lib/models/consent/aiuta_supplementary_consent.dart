import 'package:json_annotation/json_annotation.dart';

part 'aiuta_supplementary_consent.g.dart';

/// General image model of any history flows
@JsonSerializable()
class AiutaSupplementaryConsent {
  /// Original text of optional consent
  final String consentText;

  /// Is optional consent obtained or not
  final bool isObtained;

  AiutaSupplementaryConsent({
    required this.consentText,
    required this.isObtained,
  });

  /// Converts the JSON object to an AiutaSupplementaryConsent.
  factory AiutaSupplementaryConsent.fromJson(Map<String, dynamic> json) =>
      _$AiutaSupplementaryConsentFromJson(json);

  /// Converts the AiutaSupplementaryConsent to a JSON object.
  Map<String, dynamic> toJson() => _$AiutaSupplementaryConsentToJson(this);
}
