// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'aiuta_auth_action.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RequestJWTAction _$RequestJWTActionFromJson(Map<String, dynamic> json) =>
    RequestJWTAction(
      params: json['params'] as String,
    )..type = $enumDecode(_$AiutaAuthActionTypeEnumMap, json['type']);

Map<String, dynamic> _$RequestJWTActionToJson(RequestJWTAction instance) =>
    <String, dynamic>{
      'type': _$AiutaAuthActionTypeEnumMap[instance.type]!,
      'params': instance.params,
    };

const _$AiutaAuthActionTypeEnumMap = {
  AiutaAuthActionType.requestJWT: 'requestJWT',
};
