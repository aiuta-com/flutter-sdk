/// Events of interaction with the results of the try-on.
enum AiutaAnalyticsResultsEventType {
  /// The user has shared the generated image.
  resultShared,

  /// The user has added the product to the wishlist.
  productAddToWishlist,

  /// The user has added the product to the cart.
  productAddToCart,

  /// The user pressed the "Try on another photo" button.
  pickOtherPhoto
}
