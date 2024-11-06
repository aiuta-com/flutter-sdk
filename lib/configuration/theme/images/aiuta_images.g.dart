// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'aiuta_images.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AiutaImages _$AiutaImagesFromJson(Map<String, dynamic> json) => AiutaImages(
      preonboardingImagePath: json['preonboardingImagePath'] as String?,
      onboardingImages: json['onboardingImages'] == null
          ? null
          : AiutaOnboardingImages.fromJson(
              json['onboardingImages'] as Map<String, dynamic>),
      selectorEmptyImagePath: json['selectorEmptyImagePath'] as String?,
      feedbackThanksImagePath: json['feedbackThanksImagePath'] as String?,
    );

Map<String, dynamic> _$AiutaImagesToJson(AiutaImages instance) =>
    <String, dynamic>{
      'preonboardingImagePath': instance.preonboardingImagePath,
      'onboardingImages': instance.onboardingImages,
      'selectorEmptyImagePath': instance.selectorEmptyImagePath,
      'feedbackThanksImagePath': instance.feedbackThanksImagePath,
    };
