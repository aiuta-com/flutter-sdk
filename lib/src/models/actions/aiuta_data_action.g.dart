// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'aiuta_data_action.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ObtainUserConsentAction _$ObtainUserConsentActionFromJson(
        Map<String, dynamic> json) =>
    ObtainUserConsentAction()
      ..type = $enumDecode(_$AiutaDataActionTypeEnumMap, json['type']);

Map<String, dynamic> _$ObtainUserConsentActionToJson(
        ObtainUserConsentAction instance) =>
    <String, dynamic>{
      'type': _$AiutaDataActionTypeEnumMap[instance.type]!,
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
          .map((e) => AiutaUploadedImage.fromJson(e as Map<String, dynamic>))
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
      uploadedImage: AiutaUploadedImage.fromJson(
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
          .map((e) => AiutaUploadedImage.fromJson(e as Map<String, dynamic>))
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
      generatedImages: (json['generatedImages'] as List<dynamic>)
          .map((e) => AiutaGeneratedImage.fromJson(e as Map<String, dynamic>))
          .toList(),
    )..type = $enumDecode(_$AiutaDataActionTypeEnumMap, json['type']);

Map<String, dynamic> _$AddGeneratedImagesActionToJson(
        AddGeneratedImagesAction instance) =>
    <String, dynamic>{
      'type': _$AiutaDataActionTypeEnumMap[instance.type]!,
      'generatedImages': instance.generatedImages,
    };

DeleteGeneratedImagesAction _$DeleteGeneratedImagesActionFromJson(
        Map<String, dynamic> json) =>
    DeleteGeneratedImagesAction(
      generatedImages: (json['generatedImages'] as List<dynamic>)
          .map((e) => AiutaGeneratedImage.fromJson(e as Map<String, dynamic>))
          .toList(),
    )..type = $enumDecode(_$AiutaDataActionTypeEnumMap, json['type']);

Map<String, dynamic> _$DeleteGeneratedImagesActionToJson(
        DeleteGeneratedImagesAction instance) =>
    <String, dynamic>{
      'type': _$AiutaDataActionTypeEnumMap[instance.type]!,
      'generatedImages': instance.generatedImages,
    };
