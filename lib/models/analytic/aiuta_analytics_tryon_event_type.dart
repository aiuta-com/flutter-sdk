/// This represents the type of event that is sent when a user waits for the try-on process to finish.
enum AiutaAnalyticsTryOnEventType {
  /// Chosen photo is uploaded to the server.
  /// May be omitted if the photo selected by the user was previously uploaded.
  photoUploaded,

  /// The try-on process has started.
  tryOnStarted,

  /// The try-on process has finished.
  /// Results will be shown to the user.
  tryOnFinished,

  /// Try-on process has aborted, because user input
  /// is not valid
  tryOnAborted,

  /// Try-on process has failed.
  tryOnError,
}
