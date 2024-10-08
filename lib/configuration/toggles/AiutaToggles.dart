import 'dart:ffi';

import 'package:json_annotation/json_annotation.dart';

part 'AiutaToggles.g.dart';

@JsonSerializable()
class AiutaToggles {
  final bool isHistoryAvailable;
  final bool isWishlistAvailable;
  final bool isPreOnboardingAvailable;
  final bool isOnboardingAppBarExtended;
  final bool isMainAppbarReversed;

  AiutaToggles({
    required this.isHistoryAvailable,
    required this.isWishlistAvailable,
    required this.isPreOnboardingAvailable,
    required this.isOnboardingAppBarExtended,
    required this.isMainAppbarReversed,
  });

  // Json staff
  factory AiutaToggles.fromJson(Map<String, dynamic> json) =>
      _$AiutaTogglesFromJson(json);

  Map<String, dynamic> toJson() => _$AiutaTogglesToJson(this);
}
