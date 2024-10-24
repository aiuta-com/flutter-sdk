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

/// The configuration object that is used to configure the Aiuta SDK.
@JsonSerializable()
class AiutaConfiguration {
  /// Presentation mode of the Aiuta SDK.
  final AiutaMode mode;

  /// Authentication configuration.
  /// This is required to authenticate Aiuta to use digital try-on API with your credentials.
  /// Supported authentication methods are ApiKey and JWT.
  /// When using JWT, only sensitive requests (such as starting virtual try-on) are authenticated with JWT.
  /// Other requests are authenticated with your subscription id.
  /// Please see [Aiuta API documentation](https://developer.aiuta.com/docs/start) for instructions on how to get your credentials.
  final AiutaAuthentication authentication;

  /// Toggles some features of the Aiuta SDK behavior.
  final AiutaToggles toggles;

  /// Language configuration.
  /// You can use StandardLanguage to use the built-in localization provided by the Aiuta SDK.
  /// Or you can create your own CustomLanguage implementation to provide custom localization.
  final AiutaLanguage language;

  /// Listeners for various significant user actions in the Aiuta SDK.
  @JsonKey(toJson: toNull, fromJson: toNull, includeIfNull: false)
  final AiutaListeners listeners;

  /// Optional data provider to manage data of the Aiuta SDK.
  /// This allows you to store and retrieve data (such as user consent, uploaded images, generation history) from your own data source.
  /// If not provided, the Aiuta SDK uses the built-in data provider that stores data in local storage on the device.
  /// Default data storage is not linked to the user and is not shared between different devices. Will be deleted when the app is uninstalled.
  /// Creating a custom data provider allows you to store data in your own data source and link it to the user.
  final AiutaDataProvider? dataProvider;

  /// Theme configuration.
  /// You can use the built-in AiutaTheme to use the default theme provided by the Aiuta SDK.
  /// It uses system default fonts and Aiuta color scheme and built-in icons.
  /// To use the default theme, you can provide null or omit this field.
  /// Alternatively, you can provide your own custom theme by creating a custom AiutaTheme providing your own fonts, colors, shapes, icons, etc.
  final AiutaTheme? theme;

  /// Optional listener for analytics events.
  /// This listener is called when an analytics event is triggered by the Aiuta SDK.
  /// You can use this listener to send analytics events to your analytics provider.
  /// For example, you can use Firebase Analytics, Google Analytics, or any other analytics provider.
  @JsonKey(toJson: toNull, fromJson: toNull, includeIfNull: false)
  final Future<void> Function(AiutaAnalyticEvent)? onAnalyticsEvent;

  /// Create a new instance of AiutaConfiguration.
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
  /// Create a new instance of AiutaConfiguration from a json map.
  factory AiutaConfiguration.fromJson(Map<String, dynamic> json) =>
      _$AiutaConfigurationFromJson(json);

  /// Convert this object to a json map.
  Map<String, dynamic> toJson() => _$AiutaConfigurationToJson(this);
}
