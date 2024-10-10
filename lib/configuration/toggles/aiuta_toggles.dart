import 'package:json_annotation/json_annotation.dart';

part 'aiuta_toggles.g.dart';

@JsonSerializable()
class AiutaToggles {
  final bool isHistoryAvailable;
  final bool isWishlistAvailable;
  final bool isPreOnboardingAvailable;

  AiutaToggles({
    required this.isHistoryAvailable,
    required this.isWishlistAvailable,
    required this.isPreOnboardingAvailable,
  });

  // Json staff
  factory AiutaToggles.fromJson(Map<String, dynamic> json) =>
      _$AiutaTogglesFromJson(json);

  Map<String, dynamic> toJson() => _$AiutaTogglesToJson(this);
}
