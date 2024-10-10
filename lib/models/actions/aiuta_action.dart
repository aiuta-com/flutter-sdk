import 'package:aiutasdk/models/actions/aiuta_action_type.dart';
import 'package:aiutasdk/models/product/aiuta_product.dart';
import 'package:json_annotation/json_annotation.dart';

part 'aiuta_action.g.dart';

sealed class AiutaAction {
  AiutaActionType type;

  AiutaAction(this.type);

  // Json staff
  factory AiutaAction.fromJson(Map<String, dynamic> json) {
    switch (json['type'] as String) {
      case 'addToWishlistClick':
        return AddToWishlistAction.fromJson(json);
      case 'addToCartClick':
        return AddToCartAction.fromJson(json);
      default:
        throw Exception('Unknown action type');
    }
  }

  Map<String, dynamic> toJson();
}

@JsonSerializable()
class AddToWishlistAction extends AiutaAction {
  final AiutaProduct product;

  AddToWishlistAction({
    required this.product,
  }) : super(AiutaActionType.addToWishlistClick);

  // Json staff
  factory AddToWishlistAction.fromJson(Map<String, dynamic> json) =>
      _$AddToWishlistActionFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$AddToWishlistActionToJson(this);
}

@JsonSerializable()
class AddToCartAction extends AiutaAction {
  final AiutaProduct product;

  AddToCartAction({
    required this.product,
  }) : super(AiutaActionType.addToCartClick);

  // Json staff
  factory AddToCartAction.fromJson(Map<String, dynamic> json) =>
      _$AddToCartActionFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$AddToCartActionToJson(this);
}
