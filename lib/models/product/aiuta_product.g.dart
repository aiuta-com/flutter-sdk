// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'aiuta_product.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AiutaProduct _$AiutaProductFromJson(Map<String, dynamic> json) => AiutaProduct(
      skuId: json['skuId'] as String,
      catalogName: json['catalogName'] as String?,
      title: json['title'] as String,
      imageUrls:
          (json['imageUrls'] as List<dynamic>).map((e) => e as String).toList(),
      localizedPrice: json['localizedPrice'] as String?,
      localizedOldPrice: json['localizedOldPrice'] as String?,
      brand: json['brand'] as String,
      additionalShareInfo: json['additionalShareInfo'] as String?,
      inWishlist: json['inWishlist'] as bool,
    );

Map<String, dynamic> _$AiutaProductToJson(AiutaProduct instance) =>
    <String, dynamic>{
      'skuId': instance.skuId,
      'catalogName': instance.catalogName,
      'title': instance.title,
      'imageUrls': instance.imageUrls,
      'localizedPrice': instance.localizedPrice,
      'localizedOldPrice': instance.localizedOldPrice,
      'brand': instance.brand,
      'additionalShareInfo': instance.additionalShareInfo,
      'inWishlist': instance.inWishlist,
    };
