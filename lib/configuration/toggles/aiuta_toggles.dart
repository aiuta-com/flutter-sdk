import 'package:json_annotation/json_annotation.dart';

part 'aiuta_toggles.g.dart';

/// Toggles some features of the Aiuta SDK behavior.
@JsonSerializable()
class AiutaToggles {
  /// Whether the history feature is available.
  /// If true, the user can see the history of their virtual try-ons.
  /// If false, the history feature is disabled, all corresponding UI elements are hidden.
  final bool isHistoryAvailable;

  /// Whether the wishlist feature is available.
  ///
  /// If true, the user can add items to their wishlist within the Aiuta SDK.
  /// You should provide the [AiutaListeners.addToWishlistClick] listener to handle the add-to-wishlist action.
  ///
  /// If false, the wishlist feature is disabled, all corresponding UI elements are hidden.
  final bool isWishlistAvailable;

  /// Whether the splash screen feature is available as a part of the onboarding process.
  final bool isPreOnboardingAvailable;

  /// Flag which turn on or off possibility to use share option.
  final bool isShareAvailable;

  /// Creates a new instance of [AiutaToggles].
  AiutaToggles({
    required this.isHistoryAvailable,
    required this.isWishlistAvailable,
    required this.isPreOnboardingAvailable,
    required this.isShareAvailable,
  });

  // Json staff
  /// Creates a new instance of [AiutaToggles] from a JSON object.
  factory AiutaToggles.fromJson(Map<String, dynamic> json) =>
      _$AiutaTogglesFromJson(json);

  /// Convert this object to a JSON object.
  Map<String, dynamic> toJson() => _$AiutaTogglesToJson(this);
}
