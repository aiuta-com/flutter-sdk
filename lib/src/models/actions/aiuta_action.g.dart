// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'aiuta_action.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddToWishlistAction _$AddToWishlistActionFromJson(Map<String, dynamic> json) =>
    AddToWishlistAction(
      product: AiutaProduct.fromJson(json['product'] as Map<String, dynamic>),
    )..type = $enumDecode(_$AiutaActionTypeEnumMap, json['type']);

Map<String, dynamic> _$AddToWishlistActionToJson(
        AddToWishlistAction instance) =>
    <String, dynamic>{
      'type': _$AiutaActionTypeEnumMap[instance.type]!,
      'product': instance.product,
    };

const _$AiutaActionTypeEnumMap = {
  AiutaActionType.addToWishlistClick: 'addToWishlistClick',
  AiutaActionType.addToCartClick: 'addToCartClick',
};

AddToCartAction _$AddToCartActionFromJson(Map<String, dynamic> json) =>
    AddToCartAction(
      product: AiutaProduct.fromJson(json['product'] as Map<String, dynamic>),
    )..type = $enumDecode(_$AiutaActionTypeEnumMap, json['type']);

Map<String, dynamic> _$AddToCartActionToJson(AddToCartAction instance) =>
    <String, dynamic>{
      'type': _$AiutaActionTypeEnumMap[instance.type]!,
      'product': instance.product,
    };
