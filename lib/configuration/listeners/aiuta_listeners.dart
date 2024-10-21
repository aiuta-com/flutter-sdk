import 'package:aiuta_flutter/models/product/aiuta_product.dart';

/// Listeners for various significant user actions in the Aiuta SDK.
class AiutaListeners {
  /// Called when the user clicks the "Add to Wishlist" button.
  /// Should return a Future that completes when the product is added to the wishlist.
  /// The Future should return the updated product object with the new wishlist status.
  /// If the product is already in the wishlist, calling this function may remove it from the wishlist
  /// or you can choose to keep it in the wishlist, depending on your implementation.
  final Future<AiutaProduct> Function(AiutaProduct) addToWishlistClick;

  /// Called when the user clicks the "Add to Cart" button.
  /// This will be called when the user clicks the "Add to Cart" button in the product detail screen after Aiuta SDK is closed.
  /// You should respond to this event by adding the product to the cart in your app or showing corresponding UI.
  final Future<void> Function(AiutaProduct) addToCartClick;

  /// Creates a new instance of AiutaListeners.
  AiutaListeners({
    required this.addToWishlistClick,
    required this.addToCartClick,
  });
}
