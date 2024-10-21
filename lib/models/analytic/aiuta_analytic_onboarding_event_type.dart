/// This enum is used to represent the type of onboarding event in the Aiuta SDK.
enum AiutaAnalyticOnboardingEventType {
  /// The user clicked the start button on the welcome splash screen.
  welcomeStartClicked,

  /// The user has given consent to the terms and conditions and pressed the start button.
  consentGiven,

  /// Onboarding process is finished. Main screen will be shown.
  onboardingFinished,
}
