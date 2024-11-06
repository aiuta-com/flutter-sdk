import 'package:json_annotation/json_annotation.dart';

part 'aiuta_product.g.dart';

/// Represents the information about a SKU in the Aiuta platform.
@JsonSerializable()
class AiutaProduct {
  /// A unique identifier for the SKU.
  final String skuId;

  /// The catalog identifier the SKU belongs to.
  /// It is recommended not to specify a skuCatalog unless it is explicitly necessary.
  final String? catalogName;

  /// The localized title of the SKU.
  final String title;

  /// A list of URLs pointing to the images of the SKU.
  final List<String> imageUrls;

  /// The localized price of the SKU.
  /// Optional. If not provided, the price field will be hidden in the product details
  /// and the title field can might take up more space.
  /// If provided, it should be formatted as a string with the currency symbol and the amount.
  final String? localizedPrice;

  /// The localized old price of the SKU.
  /// Optional. Same as localizedPrice, but for the old price to be displayed as a strikethrough near the current price.
  final String? localizedOldPrice;

  /// The brand of the SKU.
  final String brand;

  /// Optional additional information that can be shared when the user shares the generated image of try-on result.
  /// May include a link to the product page, a discount code, or any other information that can be useful for the user.
  final String? additionalShareInfo;

  /// A boolean value indicating whether the SKU is in the user's wishlist to display this status correctly.
  final bool inWishlist;

  /// Creates a new instance of AiutaProduct to pass the information about a SKU in the Aiuta platform.
  AiutaProduct({
    required this.skuId,
    this.catalogName,
    required this.title,
    required this.imageUrls,
    this.localizedPrice,
    this.localizedOldPrice,
    required this.brand,
    this.additionalShareInfo,
    required this.inWishlist,
  });

  // Json staff
  /// Creates a new instance of AiutaProduct from a JSON object.
  factory AiutaProduct.fromJson(Map<String, dynamic> json) =>
      _$AiutaProductFromJson(json);

  /// Converts the AiutaProduct instance to a JSON object.
  Map<String, dynamic> toJson() => _$AiutaProductToJson(this);
}
