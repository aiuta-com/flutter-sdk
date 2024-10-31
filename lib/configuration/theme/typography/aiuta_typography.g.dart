// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'aiuta_typography.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AiutaTypography _$AiutaTypographyFromJson(Map<String, dynamic> json) =>
    AiutaTypography(
      familyFonts: (json['familyFonts'] as List<dynamic>)
          .map((e) => AiutaFont.fromJson(e as Map<String, dynamic>))
          .toList(),
      titleXL: AiutaTextStyle.fromJson(json['titleXL'] as Map<String, dynamic>),
      welcomeText:
          AiutaTextStyle.fromJson(json['welcomeText'] as Map<String, dynamic>),
      titleL: AiutaTextStyle.fromJson(json['titleL'] as Map<String, dynamic>),
      titleM: AiutaTextStyle.fromJson(json['titleM'] as Map<String, dynamic>),
      navbar: AiutaTextStyle.fromJson(json['navbar'] as Map<String, dynamic>),
      regular: AiutaTextStyle.fromJson(json['regular'] as Map<String, dynamic>),
      button: AiutaTextStyle.fromJson(json['button'] as Map<String, dynamic>),
      smallButton:
          AiutaTextStyle.fromJson(json['smallButton'] as Map<String, dynamic>),
      cells: AiutaTextStyle.fromJson(json['cells'] as Map<String, dynamic>),
      chips: AiutaTextStyle.fromJson(json['chips'] as Map<String, dynamic>),
      productName:
          AiutaTextStyle.fromJson(json['productName'] as Map<String, dynamic>),
      price: AiutaTextStyle.fromJson(json['price'] as Map<String, dynamic>),
      brandName:
          AiutaTextStyle.fromJson(json['brandName'] as Map<String, dynamic>),
      description:
          AiutaTextStyle.fromJson(json['description'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AiutaTypographyToJson(AiutaTypography instance) =>
    <String, dynamic>{
      'familyFonts': instance.familyFonts,
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
