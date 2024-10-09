// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'aiuta_typography.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AiutaTypography _$AiutaTypographyFromJson(Map<String, dynamic> json) =>
    AiutaTypography(
      titleXL: AiutaFont.fromJson(json['titleXL'] as Map<String, dynamic>),
      welcomeText:
          AiutaFont.fromJson(json['welcomeText'] as Map<String, dynamic>),
      titleL: AiutaFont.fromJson(json['titleL'] as Map<String, dynamic>),
      titleM: AiutaFont.fromJson(json['titleM'] as Map<String, dynamic>),
      navbar: AiutaFont.fromJson(json['navbar'] as Map<String, dynamic>),
      regular: AiutaFont.fromJson(json['regular'] as Map<String, dynamic>),
      button: AiutaFont.fromJson(json['button'] as Map<String, dynamic>),
      smallButton:
          AiutaFont.fromJson(json['smallButton'] as Map<String, dynamic>),
      cells: AiutaFont.fromJson(json['cells'] as Map<String, dynamic>),
      chips: AiutaFont.fromJson(json['chips'] as Map<String, dynamic>),
      productName:
          AiutaFont.fromJson(json['productName'] as Map<String, dynamic>),
      price: AiutaFont.fromJson(json['price'] as Map<String, dynamic>),
      brandName: AiutaFont.fromJson(json['brandName'] as Map<String, dynamic>),
      description:
          AiutaFont.fromJson(json['description'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AiutaTypographyToJson(AiutaTypography instance) =>
    <String, dynamic>{
      'titleXL': instance.titleXL,
      'welcomeText': instance.welcomeText,
      'titleL': instance.titleL,
      'titleM': instance.titleM,
      'navbar': instance.navbar,
      'regular': instance.regular,
      'button': instance.button,
      'smallButton': instance.smallButton,
      'cells': instance.cells,
      'chips': instance.chips,
      'productName': instance.productName,
      'price': instance.price,
      'brandName': instance.brandName,
      'description': instance.description,
    };
