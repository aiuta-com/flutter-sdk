// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'aiuta_data_provider.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AiutaDataProvider _$AiutaDataProviderFromJson(Map<String, dynamic> json) =>
    AiutaDataProvider(
      isUserConsentObtained: toNull(json['isUserConsentObtainedListenable']),
      uploadedImages: toNull(json['uploadedImagesListenable']),
      generatedImages: toNull(json['generatedImagesListenable']),
      listeners: toNull(json['listeners']),
    );

Map<String, dynamic> _$AiutaDataProviderToJson(AiutaDataProvider instance) {
  final val = <String, dynamic>{
    'isUserConsentObtained': instance._isUserConsentObtained,
    'uploadedImages': instance._uploadedImages,
    'generatedImages': instance._generatedImages,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('listeners', toNull(instance.listeners));
  return val;
}
