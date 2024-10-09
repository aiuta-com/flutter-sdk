// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'aiuta_product.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AiutaProduct _$AiutaProductFromJson(Map<String, dynamic> json) => AiutaProduct(
      skuId: json['skuId'] as String,
      catalogName: json['catalogName'] as String?,
      description: json['description'] as String,
      imageUrls:
          (json['imageUrls'] as List<dynamic>).map((e) => e as String).toList(),
      localizedPrice: json['localizedPrice'] as String,
      localizedOldPrice: json['localizedOldPrice'] as String?,
      store: json['store'] as String,
      generateMoreSKU: (json['generateMoreSKU'] as List<dynamic>?)
          ?.map((e) => AiutaProduct.fromJson(e as Map<String, dynamic>))
          .toList(),
      additionalShareInfo: json['additionalShareInfo'] as String?,
      inWishlist: json['inWishlist'] as bool,
    );

Map<String, dynamic> _$AiutaProductToJson(AiutaProduct instance) =>
    <String, dynamic>{
      'skuId': instance.skuId,
      'catalogName': instance.catalogName,
      'description': instance.description,
      'imageUrls': instance.imageUrls,
      'localizedPrice': instance.localizedPrice,
      'localizedOldPrice': instance.localizedOldPrice,
      'store': instance.store,
      'generateMoreSKU': instance.generateMoreSKU,
      'additionalShareInfo': instance.additionalShareInfo,
      'inWishlist': instance.inWishlist,
    };
