import 'AiutaSKUItem.dart';

class AiutaListeners {
  final Future<AiutaSKUItem> Function(AiutaSKUItem)
      addToWishlistActiveItemClick;
  final Future<AiutaSKUItem> Function(AiutaSKUItem)
      addToWishlistGenerateMoreItemClick;
  final Future<void> Function(AiutaSKUItem) addToCartClick;

  AiutaListeners({
    required this.addToWishlistActiveItemClick,
    required this.addToWishlistGenerateMoreItemClick,
    required this.addToCartClick,
  });
}
