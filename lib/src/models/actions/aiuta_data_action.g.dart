// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'aiuta_data_action.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ObtainUserConsentAction _$ObtainUserConsentActionFromJson(
        Map<String, dynamic> json) =>
    ObtainUserConsentAction(
      supplementaryConsents: (json['supplementaryConsents'] as List<dynamic>)
          .map((e) =>
              AiutaSupplementaryConsent.fromJson(e as Map<String, dynamic>))
          .toList(),
    )..type = $enumDecode(_$AiutaDataActionTypeEnumMap, json['type']);

Map<String, dynamic> _$ObtainUserConsentActionToJson(
        ObtainUserConsentAction instance) =>
    <String, dynamic>{
      'type': _$AiutaDataActionTypeEnumMap[instance.type]!,
      'supplementaryConsents': instance.supplementaryConsents,
    };

const _$AiutaDataActionTypeEnumMap = {
  AiutaDataActionType.obtainUserConsent: 'obtainUserConsent',
  AiutaDataActionType.addUploadedImages: 'addUploadedImages',
  AiutaDataActionType.selectUploadedImage: 'selectUploadedImage',
  AiutaDataActionType.deleteUploadedImages: 'deleteUploadedImages',
  AiutaDataActionType.addGeneratedImages: 'addGeneratedImages',
  AiutaDataActionType.deleteGeneratedImages: 'deleteGeneratedImages',
};

AddUploadedImagesAction _$AddUploadedImagesActionFromJson(
        Map<String, dynamic> json) =>
    AddUploadedImagesAction(
      uploadedImages: (json['uploadedImages'] as List<dynamic>)
          .map((e) => AiutaHistoryImage.fromJson(e as Map<String, dynamic>))
          .toList(),
    )..type = $enumDecode(_$AiutaDataActionTypeEnumMap, json['type']);

Map<String, dynamic> _$AddUploadedImagesActionToJson(
        AddUploadedImagesAction instance) =>
    <String, dynamic>{
      'type': _$AiutaDataActionTypeEnumMap[instance.type]!,
      'uploadedImages': instance.uploadedImages,
    };

SelectUploadedImageAction _$SelectUploadedImageActionFromJson(
        Map<String, dynamic> json) =>
    SelectUploadedImageAction(
      uploadedImage: AiutaHistoryImage.fromJson(
          json['uploadedImage'] as Map<String, dynamic>),
    )..type = $enumDecode(_$AiutaDataActionTypeEnumMap, json['type']);

Map<String, dynamic> _$SelectUploadedImageActionToJson(
        SelectUploadedImageAction instance) =>
    <String, dynamic>{
      'type': _$AiutaDataActionTypeEnumMap[instance.type]!,
      'uploadedImage': instance.uploadedImage,
    };

DeleteUploadedImagesAction _$DeleteUploadedImagesActionFromJson(
        Map<String, dynamic> json) =>
    DeleteUploadedImagesAction(
      uploadedImages: (json['uploadedImages'] as List<dynamic>)
          .map((e) => AiutaHistoryImage.fromJson(e as Map<String, dynamic>))
          .toList(),
    )..type = $enumDecode(_$AiutaDataActionTypeEnumMap, json['type']);

Map<String, dynamic> _$DeleteUploadedImagesActionToJson(
        DeleteUploadedImagesAction instance) =>
    <String, dynamic>{
      'type': _$AiutaDataActionTypeEnumMap[instance.type]!,
      'uploadedImages': instance.uploadedImages,
    };

AddGeneratedImagesAction _$AddGeneratedImagesActionFromJson(
        Map<String, dynamic> json) =>
    AddGeneratedImagesAction(
      productId: json['productId'] as String,
      generatedImages: (json['generatedImages'] as List<dynamic>)
          .map((e) => AiutaHistoryImage.fromJson(e as Map<String, dynamic>))
          .toList(),
    )..type = $enumDecode(_$AiutaDataActionTypeEnumMap, json['type']);

Map<String, dynamic> _$AddGeneratedImagesActionToJson(
        AddGeneratedImagesAction instance) =>
    <String, dynamic>{
      'type': _$AiutaDataActionTypeEnumMap[instance.type]!,
      'productId': instance.productId,
      'generatedImages': instance.generatedImages,
    };

DeleteGeneratedImagesAction _$DeleteGeneratedImagesActionFromJson(
        Map<String, dynamic> json) =>
    DeleteGeneratedImagesAction(
      generatedImages: (json['generatedImages'] as List<dynamic>)
          .map((e) => AiutaHistoryImage.fromJson(e as Map<String, dynamic>))
          .toList(),
    )..type = $enumDecode(_$AiutaDataActionTypeEnumMap, json['type']);

Map<String, dynamic> _$DeleteGeneratedImagesActionToJson(
        DeleteGeneratedImagesAction instance) =>
    <String, dynamic>{
      'type': _$AiutaDataActionTypeEnumMap[instance.type]!,
      'generatedImages': instance.generatedImages,
    };
