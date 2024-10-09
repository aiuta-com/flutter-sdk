import 'package:aiutasdk/models/AiutaProduct.dart';

class AiutaListeners {
  final Future<AiutaProduct> Function(AiutaProduct) addToWishlistClick;
  final Future<void> Function(AiutaProduct) addToCartClick;

  AiutaListeners({
    required this.addToWishlistClick,
    required this.addToCartClick,
  });
}
