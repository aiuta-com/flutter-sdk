import 'package:json_annotation/json_annotation.dart';

part 'AiutaProduct.g.dart';

@JsonSerializable()
class AiutaProduct {
  final String skuId;
  final String? catalogName;
  final String description;
  final List<String> imageUrls;
  final String localizedPrice;
  final String? localizedOldPrice;
  final String store;
  final List<AiutaProduct>? generateMoreSKU;
  final String? additionalShareInfo;
  final bool inWishlist;

  AiutaProduct({
    required this.skuId,
    this.catalogName,
    required this.description,
    required this.imageUrls,
    required this.localizedPrice,
    this.localizedOldPrice,
    required this.store,
    this.generateMoreSKU,
    this.additionalShareInfo,
    required this.inWishlist,
  });

  // Json staff
  factory AiutaProduct.fromJson(Map<String, dynamic> json) =>
      _$AiutaProductFromJson(json);

  Map<String, dynamic> toJson() => _$AiutaProductToJson(this);
}
