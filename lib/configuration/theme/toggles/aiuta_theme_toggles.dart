import 'package:json_annotation/json_annotation.dart';

part 'aiuta_theme_toggles.g.dart';

/// Toggles some features of the Aiuta SDK appearance.
@JsonSerializable()
class AiutaThemeToggles {
  /// Should the navigation bar in onboarding screens contains title and back button?
  final bool isOnboardingAppBarExtended;

  /// If true, the main navigation bar of the SDK will prefer close button on the right.
  /// By default, the main app bar has a back button on the left.
  final bool isMainAppbarReversed;

  /// If true, shadows will be reduced in the SDK.
  final bool isShadowsReduced;

  /// If true, delimiters between vertical list items will be extended
  /// to the right edge of the screen.
  final bool isDelimitersExtended;

  /// If true, the first image of the product will have extended padding in
  /// the product details bottom sheets.
  final bool isProductFirstImageExtendedPaddingApplied;

  /// Creates a new AiutaThemeToggles instance.
  AiutaThemeToggles({
    required this.isOnboardingAppBarExtended,
    required this.isMainAppbarReversed,
    required this.isShadowsReduced,
    required this.isDelimitersExtended,
    required this.isProductFirstImageExtendedPaddingApplied,
  });

  // Json staff
  /// Create a new instance of AiutaThemeToggles from a JSON object.
  factory AiutaThemeToggles.fromJson(Map<String, dynamic> json) =>
      _$AiutaThemeTogglesFromJson(json);

  /// Convert this object to a JSON object.
  Map<String, dynamic> toJson() => _$AiutaThemeTogglesToJson(this);
}
