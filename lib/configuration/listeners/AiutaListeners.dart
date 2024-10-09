import 'package:aiutasdk/models/AiutaProduct.dart';

class AiutaListeners {
  final Future<AiutaProduct> Function(AiutaProduct)
      addToWishlistActiveItemClick;
  final Future<AiutaProduct> Function(AiutaProduct)
      addToWishlistGenerateMoreItemClick;
  final Future<void> Function(AiutaProduct) addToCartClick;

  AiutaListeners({
    required this.addToWishlistActiveItemClick,
    required this.addToWishlistGenerateMoreItemClick,
    required this.addToCartClick,
  });
}
