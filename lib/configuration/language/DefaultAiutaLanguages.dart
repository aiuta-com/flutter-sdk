enum DefaultAiutaLanguages {
  english(languageCode: "en"),
  turkish(languageCode: "tr"),
  russian(languageCode: "ru");

  // Code of language in ISO-639
  final String languageCode;

  const DefaultAiutaLanguages({required this.languageCode});
}
