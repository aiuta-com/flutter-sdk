import 'package:json_annotation/json_annotation.dart';

import '../utils/NullUtils.dart';
import 'auth/AiutaAuthentication.dart';
import 'language/AiutaLanguage.dart';
import 'listeners/AiutaListeners.dart';
import 'mode/AiutaMode.dart';
import 'theme/AiutaTheme.dart';
import 'toggles/AiutaToggles.dart';

part 'AiutaConfiguration.g.dart';

@JsonSerializable()
class AiutaConfiguration {
  // Mode
  final AiutaMode mode;

  // Authentication
  final AiutaAuthentication authentication;

  // Toggles
  final AiutaToggles toggles;

  // Language
  final AiutaLanguage language;

  // Listeners
  // Ignore this in json
  @JsonKey(toJson: toNull, fromJson: toNull, includeIfNull: false)
  final AiutaListeners listeners;

  // Theme
  final AiutaTheme? theme;

  AiutaConfiguration({
    required this.mode,
    required this.authentication,
    required this.toggles,
    required this.language,
    required this.listeners,
    this.theme,
  });

  // Json staff
  factory AiutaConfiguration.fromJson(Map<String, dynamic> json) =>
      _$AiutaConfigurationFromJson(json);

  Map<String, dynamic> toJson() => _$AiutaConfigurationToJson(this);
}
