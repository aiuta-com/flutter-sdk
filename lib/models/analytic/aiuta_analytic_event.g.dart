// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'aiuta_analytic_event.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AiutaAnalyticPageEvent _$AiutaAnalyticPageEventFromJson(
        Map<String, dynamic> json) =>
    AiutaAnalyticPageEvent(
      pageId: $enumDecode(_$AiutaAnalyticPageIdEnumMap, json['pageId']),
    );

Map<String, dynamic> _$AiutaAnalyticPageEventToJson(
        AiutaAnalyticPageEvent instance) =>
    <String, dynamic>{
      'pageId': _$AiutaAnalyticPageIdEnumMap[instance.pageId]!,
    };

const _$AiutaAnalyticPageIdEnumMap = {
  AiutaAnalyticPageId.welcome: 'welcome',
  AiutaAnalyticPageId.howItWorks: 'howItWorks',
  AiutaAnalyticPageId.bestResults: 'bestResults',
  AiutaAnalyticPageId.consent: 'consent',
  AiutaAnalyticPageId.imagePicker: 'imagePicker',
  AiutaAnalyticPageId.loading: 'loading',
  AiutaAnalyticPageId.results: 'results',
  AiutaAnalyticPageId.history: 'history',
};

AiutaAnalyticOnboardingEvent _$AiutaAnalyticOnboardingEventFromJson(
        Map<String, dynamic> json) =>
    AiutaAnalyticOnboardingEvent(
      event:
          $enumDecode(_$AiutaAnalyticOnboardingEventTypeEnumMap, json['event']),
    );

Map<String, dynamic> _$AiutaAnalyticOnboardingEventToJson(
        AiutaAnalyticOnboardingEvent instance) =>
    <String, dynamic>{
      'event': _$AiutaAnalyticOnboardingEventTypeEnumMap[instance.event]!,
    };

const _$AiutaAnalyticOnboardingEventTypeEnumMap = {
  AiutaAnalyticOnboardingEventType.welcomeStartClicked: 'welcomeStartClicked',
  AiutaAnalyticOnboardingEventType.consentGiven: 'consentGiven',
  AiutaAnalyticOnboardingEventType.onboardingFinished: 'onboardingFinished',
};

AiutaAnalyticsPickerEvent _$AiutaAnalyticsPickerEventFromJson(
        Map<String, dynamic> json) =>
    AiutaAnalyticsPickerEvent(
      event: $enumDecode(_$AiutaAnalyticsPickerEventTypeEnumMap, json['event']),
      pageId: $enumDecode(_$AiutaAnalyticPageIdEnumMap, json['pageId']),
    );

Map<String, dynamic> _$AiutaAnalyticsPickerEventToJson(
        AiutaAnalyticsPickerEvent instance) =>
    <String, dynamic>{
      'event': _$AiutaAnalyticsPickerEventTypeEnumMap[instance.event]!,
      'pageId': _$AiutaAnalyticPageIdEnumMap[instance.pageId]!,
    };

const _$AiutaAnalyticsPickerEventTypeEnumMap = {
  AiutaAnalyticsPickerEventType.cameraOpened: 'cameraOpened',
  AiutaAnalyticsPickerEventType.newPhotoTaken: 'newPhotoTaken',
  AiutaAnalyticsPickerEventType.photoGalleryOpened: 'photoGalleryOpened',
  AiutaAnalyticsPickerEventType.galleryPhotoSelected: 'galleryPhotoSelected',
  AiutaAnalyticsPickerEventType.uploadsHistoryOpened: 'uploadsHistoryOpened',
  AiutaAnalyticsPickerEventType.uploadedPhotoSelected: 'uploadedPhotoSelected',
  AiutaAnalyticsPickerEventType.uploadedPhotoDeleted: 'uploadedPhotoDeleted',
};

AiutaAnalyticExitEvent _$AiutaAnalyticExitEventFromJson(
        Map<String, dynamic> json) =>
    AiutaAnalyticExitEvent(
      pageId: $enumDecode(_$AiutaAnalyticPageIdEnumMap, json['pageId']),
    );

Map<String, dynamic> _$AiutaAnalyticExitEventToJson(
        AiutaAnalyticExitEvent instance) =>
    <String, dynamic>{
      'pageId': _$AiutaAnalyticPageIdEnumMap[instance.pageId]!,
    };

AiutaAnalyticsTryOnEvent _$AiutaAnalyticsTryOnEventFromJson(
        Map<String, dynamic> json) =>
    AiutaAnalyticsTryOnEvent(
      event: $enumDecode(_$AiutaAnalyticsTryOnEventTypeEnumMap, json['event']),
      errorMessage: json['errorMessage'] as String?,
    );

Map<String, dynamic> _$AiutaAnalyticsTryOnEventToJson(
        AiutaAnalyticsTryOnEvent instance) =>
    <String, dynamic>{
      'event': _$AiutaAnalyticsTryOnEventTypeEnumMap[instance.event]!,
      'errorMessage': instance.errorMessage,
    };

const _$AiutaAnalyticsTryOnEventTypeEnumMap = {
  AiutaAnalyticsTryOnEventType.photoUploaded: 'photoUploaded',
  AiutaAnalyticsTryOnEventType.tryOnStarted: 'tryOnStarted',
  AiutaAnalyticsTryOnEventType.tryOnFinished: 'tryOnFinished',
  AiutaAnalyticsTryOnEventType.tryOnAborted: 'tryOnAborted',
  AiutaAnalyticsTryOnEventType.tryOnError: 'tryOnError',
};

AiutaAnalyticsResultsEvent _$AiutaAnalyticsResultsEventFromJson(
        Map<String, dynamic> json) =>
    AiutaAnalyticsResultsEvent(
      event:
          $enumDecode(_$AiutaAnalyticsResultsEventTypeEnumMap, json['event']),
      productId: json['productId'] as String,
    );

Map<String, dynamic> _$AiutaAnalyticsResultsEventToJson(
        AiutaAnalyticsResultsEvent instance) =>
    <String, dynamic>{
      'event': _$AiutaAnalyticsResultsEventTypeEnumMap[instance.event]!,
      'productId': instance.productId,
    };

const _$AiutaAnalyticsResultsEventTypeEnumMap = {
  AiutaAnalyticsResultsEventType.resultShared: 'resultShared',
  AiutaAnalyticsResultsEventType.productAddToWishlist: 'productAddToWishlist',
  AiutaAnalyticsResultsEventType.productAddToCart: 'productAddToCart',
  AiutaAnalyticsResultsEventType.pickOtherPhoto: 'pickOtherPhoto',
};

AiutaAnalyticsFeedbackEvent _$AiutaAnalyticsFeedbackEventFromJson(
        Map<String, dynamic> json) =>
    AiutaAnalyticsFeedbackEvent(
      event:
          $enumDecode(_$AiutaAnalyticsFeedbackEventTypeEnumMap, json['event']),
      negativeFeedbackOptionIndex:
          (json['negativeFeedbackOptionIndex'] as num?)?.toInt(),
      negativeFeedbackText: json['negativeFeedbackText'] as String?,
    );

Map<String, dynamic> _$AiutaAnalyticsFeedbackEventToJson(
        AiutaAnalyticsFeedbackEvent instance) =>
    <String, dynamic>{
      'event': _$AiutaAnalyticsFeedbackEventTypeEnumMap[instance.event]!,
      'negativeFeedbackOptionIndex': instance.negativeFeedbackOptionIndex,
      'negativeFeedbackText': instance.negativeFeedbackText,
    };

const _$AiutaAnalyticsFeedbackEventTypeEnumMap = {
  AiutaAnalyticsFeedbackEventType.positive: 'positive',
  AiutaAnalyticsFeedbackEventType.negative: 'negative',
};

AiutaAnalyticsHistoryEvent _$AiutaAnalyticsHistoryEventFromJson(
        Map<String, dynamic> json) =>
    AiutaAnalyticsHistoryEvent(
      event:
          $enumDecode(_$AiutaAnalyticsHistoryEventTypeEnumMap, json['event']),
    );

Map<String, dynamic> _$AiutaAnalyticsHistoryEventToJson(
        AiutaAnalyticsHistoryEvent instance) =>
    <String, dynamic>{
      'event': _$AiutaAnalyticsHistoryEventTypeEnumMap[instance.event]!,
    };

const _$AiutaAnalyticsHistoryEventTypeEnumMap = {
  AiutaAnalyticsHistoryEventType.generatedImageShared: 'generatedImageShared',
  AiutaAnalyticsHistoryEventType.generatedImageDeleted: 'generatedImageDeleted',
};
