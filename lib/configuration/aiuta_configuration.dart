import 'package:aiutasdk/configuration/auth/aiuta_authentication.dart';
import 'package:aiutasdk/configuration/language/aiuta_language.dart';
import 'package:aiutasdk/configuration/listeners/aiuta_listeners.dart';
import 'package:aiutasdk/configuration/mode/aiuta_mode.dart';
import 'package:aiutasdk/configuration/theme/aiuta_theme.dart';
import 'package:aiutasdk/configuration/toggles/aiuta_toggles.dart';
import 'package:aiutasdk/utils/null_utils.dart';
import 'package:json_annotation/json_annotation.dart';

part 'aiuta_configuration.g.dart';

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
