/// Enum for the different types of events that can be logged in Aiuta.
enum AiutaAnalyticEventType {
  /// User navigates to a new page.
  pageEvent,

  /// Events during onboarding.
  onboardingEvent,

  /// User interacts with the image picker.
  /// This includes selecting an uploaded image, taking a photo, choosing gallery image, etc.
  pickerEvent,

  /// User exits the Aiuta SDK.
  exitEvent,

  /// Events related to try-on process.
  tryOnEvent,

  /// Events related to the results page.
  resultsEvent,

  /// Feedback events.
  feedbackEvent,

  /// Interactions with the generation history.
  historyEvent
}
