/// Represents the different types of user activity within the image picker.
enum AiutaAnalyticsPickerEventType {
  /// The user opened the camera.
  cameraOpened,

  /// The user took a new photo.
  newPhotoTaken,

  /// The user opened the system photo gallery.
  photoGalleryOpened,

  /// The user selected a photo from the gallery.
  galleryPhotoSelected,

  /// The user opened the history of uploaded images.
  uploadsHistoryOpened,

  /// The user selected an uploaded image.
  uploadedPhotoSelected,

  /// The user deleted an uploaded image.
  uploadedPhotoDeleted,
}
