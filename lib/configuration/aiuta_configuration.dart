import 'package:aiuta_flutter/configuration/auth/aiuta_authentication.dart';
import 'package:aiuta_flutter/configuration/data_provider/aiuta_data_provider.dart';
import 'package:aiuta_flutter/configuration/language/aiuta_language.dart';
import 'package:aiuta_flutter/configuration/listeners/aiuta_listeners.dart';
import 'package:aiuta_flutter/configuration/mode/aiuta_mode.dart';
import 'package:aiuta_flutter/configuration/theme/aiuta_theme.dart';
import 'package:aiuta_flutter/configuration/toggles/aiuta_toggles.dart';
import 'package:aiuta_flutter/models/analytic/aiuta_analytic_event.dart';
import 'package:aiuta_flutter/src/utils/null_utils.dart';
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

  // Data provider
  final AiutaDataProvider? dataProvider;

  // Theme
  final AiutaTheme? theme;

  // Analytic listener
  // Ignore this in json
  @JsonKey(toJson: toNull, fromJson: toNull, includeIfNull: false)
  final Future<void> Function(AiutaAnalyticEvent)? onAnalyticsEvent;

  AiutaConfiguration({
    required this.mode,
    required this.authentication,
    required this.toggles,
    required this.language,
    required this.listeners,
    this.dataProvider,
    this.theme,
    this.onAnalyticsEvent,
  });

  // Json staff
  factory AiutaConfiguration.fromJson(Map<String, dynamic> json) =>
      _$AiutaConfigurationFromJson(json);

  Map<String, dynamic> toJson() => _$AiutaConfigurationToJson(this);
}
