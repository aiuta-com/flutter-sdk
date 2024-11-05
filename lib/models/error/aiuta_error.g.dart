// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'aiuta_error.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AiutaError _$AiutaErrorFromJson(Map<String, dynamic> json) => AiutaError(
      errorType: $enumDecode(_$AiutaErrorTypeEnumMap, json['errorType']),
    );

Map<String, dynamic> _$AiutaErrorToJson(AiutaError instance) =>
    <String, dynamic>{
      'errorType': _$AiutaErrorTypeEnumMap[instance.errorType]!,
    };

const _$AiutaErrorTypeEnumMap = {
  AiutaErrorType.failedDeleteUploadedImages: 'failedDeleteUploadedImages',
  AiutaErrorType.failedDeleteGeneratedImages: 'failedDeleteGeneratedImages',
};
