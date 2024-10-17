enum AiutaAnalyticEventType {
  // Pages
  // Onboarding
  WelcomePageEntered,
  HowItWorksPageEntered,
  BestResultPageEntered,
  ConsentPageEntered,
  // Picker
  ImagePickerPageEntered,
  LoadingTryOnPageEntered,
  // Result
  ResultPageEntered,
  // History
  HistoryPageEntered,

  // Actions
  // Onboarding
  WelcomeScreenStartButtonClicked,
  ConsentGiven,
  // Picker
  TryOnStarted,
  NewPhotoStarted,
  NewPhotoTaken,
  NewPhotoUploaded,
  TryOnResultsError,
  // Result
  TryOnResultsShown,
  FlowExit,
  GeneratedImageShared,
  ProductLike,
  ProductAddToCart,
  // Feedback
  FeedbackPositive,
  FeedbackNegative,
  // History
  HistoryScreenClicked,
  GalleryPhotoSelected,
  GalleryPhotoDeleted
}
