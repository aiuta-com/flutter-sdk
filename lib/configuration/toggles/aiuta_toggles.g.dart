// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'aiuta_toggles.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AiutaToggles _$AiutaTogglesFromJson(Map<String, dynamic> json) => AiutaToggles(
      isHistoryAvailable: json['isHistoryAvailable'] as bool,
      isWishlistAvailable: json['isWishlistAvailable'] as bool,
      isPreOnboardingAvailable: json['isPreOnboardingAvailable'] as bool,
      isShareAvailable: json['isShareAvailable'] as bool,
    );

Map<String, dynamic> _$AiutaTogglesToJson(AiutaToggles instance) =>
    <String, dynamic>{
      'isHistoryAvailable': instance.isHistoryAvailable,
      'isWishlistAvailable': instance.isWishlistAvailable,
      'isPreOnboardingAvailable': instance.isPreOnboardingAvailable,
      'isShareAvailable': instance.isShareAvailable,
    };
