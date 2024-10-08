class AiutaSKUItem {
  final String skuId;
  final String? catalogName;
  final String description;
  final List<String> imageUrls;
  final String localizedPrice;
  final String? localizedOldPrice;
  final String? localizedDiscount;
  final String store;
  final List<AiutaSKUItem>? generateMoreSKU;
  final String? additionalShareInfo;
  final bool inWishlist;

  AiutaSKUItem({
    required this.skuId,
    this.catalogName,
    required this.description,
    required this.imageUrls,
    required this.localizedPrice,
    this.localizedOldPrice,
    this.localizedDiscount,
    required this.store,
    this.generateMoreSKU,
    this.additionalShareInfo,
    required this.inWishlist,
  });
}
