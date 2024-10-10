import 'package:json_annotation/json_annotation.dart';

part 'aiuta_theme_toggles.g.dart';

@JsonSerializable()
class AiutaThemeToggles {
  final bool isOnboardingAppBarExtended;
  final bool isMainAppbarReversed;
  final bool isShadowsReduced;
  final bool isDelimitersExtended;

  AiutaThemeToggles({
    required this.isOnboardingAppBarExtended,
    required this.isMainAppbarReversed,
    required this.isShadowsReduced,
    required this.isDelimitersExtended,
  });

  // Json staff
  factory AiutaThemeToggles.fromJson(Map<String, dynamic> json) =>
      _$AiutaThemeTogglesFromJson(json);

  Map<String, dynamic> toJson() => _$AiutaThemeTogglesToJson(this);
}
