import 'auth/AiutaAuthentication.dart';
import 'language/AiutaLanguage.dart';
import 'listeners/AiutaListeners.dart';
import 'mode/AiutaMode.dart';
import 'theme/AiutaTheme.dart';
import 'toggles/AiutaToggles.dart';

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
}
