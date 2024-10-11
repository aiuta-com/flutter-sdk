import 'package:aiuta_flutter/configuration/auth/aiuta_authentication.dart';
import 'package:aiuta_flutter/configuration/dimensions/aiuta_dimensions.dart';
import 'package:aiuta_flutter/configuration/language/aiuta_language.dart';
import 'package:aiuta_flutter/configuration/listeners/aiuta_listeners.dart';
import 'package:aiuta_flutter/configuration/mode/aiuta_mode.dart';
import 'package:aiuta_flutter/configuration/theme/aiuta_theme.dart';
import 'package:aiuta_flutter/configuration/toggles/aiuta_toggles.dart';
import 'package:aiuta_flutter/utils/null_utils.dart';
import 'package:json_annotation/json_annotation.dart';

part 'aiuta_configuration.g.dart';

@JsonSerializable()
class AiutaConfiguration {
  // Mode
  final AiutaMode mode;

  // Authentication
  final AiutaAuthentication authentication;

  // Dimensions
  final AiutaDimensions? dimensions;

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
    this.dimensions,
    this.theme,
  });

  // Json staff
  factory AiutaConfiguration.fromJson(Map<String, dynamic> json) =>
      _$AiutaConfigurationFromJson(json);

  Map<String, dynamic> toJson() => _$AiutaConfigurationToJson(this);
}
