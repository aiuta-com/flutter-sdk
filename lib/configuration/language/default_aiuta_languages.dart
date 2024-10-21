/// This file contains the default languages of the Aiuta application.
/// You can use these languages to provide built-in localization in the Aiuta SDK.
enum DefaultAiutaLanguages {
  /// English language
  english(languageCode: "en"),

  /// Turkish language
  turkish(languageCode: "tr"),

  /// Russian language
  russian(languageCode: "ru");

  /// Code of language in ISO-639
  final String languageCode;

  /// Create a new instance of DefaultAiutaLanguages.
  const DefaultAiutaLanguages({required this.languageCode});
}
