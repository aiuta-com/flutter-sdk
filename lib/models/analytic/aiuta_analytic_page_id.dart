/// Enum for the different pages in the Aiuta app.
enum AiutaAnalyticPageId {
  /// The pre-onboarding screen.
  welcome,

  /// First interactive onboarding slide.
  howItWorks,

  /// Second slide of the onboarding.
  bestResults,

  /// Screen when user is asked for consent.
  consent,

  /// Main screen where user can start virtual try-on by choosing a photo.
  imagePicker,

  /// Loading screen when the image is being processed.
  loading,

  /// Screen where user can see the results of the virtual try-on.
  results,

  /// User try-on generation history.
  history
}
