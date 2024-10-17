// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'aiuta_analytic_event.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AiutaAnalyticEvent _$AiutaAnalyticEventFromJson(Map<String, dynamic> json) =>
    AiutaAnalyticEvent(
      type: $enumDecode(_$AiutaAnalyticEventTypeEnumMap, json['type']),
      params: Map<String, String?>.from(json['params'] as Map),
    );

Map<String, dynamic> _$AiutaAnalyticEventToJson(AiutaAnalyticEvent instance) =>
    <String, dynamic>{
      'type': _$AiutaAnalyticEventTypeEnumMap[instance.type]!,
      'params': instance.params,
    };

const _$AiutaAnalyticEventTypeEnumMap = {
  AiutaAnalyticEventType.WelcomePageEntered: 'WelcomePageEntered',
  AiutaAnalyticEventType.HowItWorksPageEntered: 'HowItWorksPageEntered',
  AiutaAnalyticEventType.BestResultPageEntered: 'BestResultPageEntered',
  AiutaAnalyticEventType.ConsentPageEntered: 'ConsentPageEntered',
  AiutaAnalyticEventType.ImagePickerPageEntered: 'ImagePickerPageEntered',
  AiutaAnalyticEventType.LoadingTryOnPageEntered: 'LoadingTryOnPageEntered',
  AiutaAnalyticEventType.ResultPageEntered: 'ResultPageEntered',
  AiutaAnalyticEventType.HistoryPageEntered: 'HistoryPageEntered',
  AiutaAnalyticEventType.WelcomeScreenStartButtonClicked:
      'WelcomeScreenStartButtonClicked',
  AiutaAnalyticEventType.ConsentGiven: 'ConsentGiven',
  AiutaAnalyticEventType.TryOnStarted: 'TryOnStarted',
  AiutaAnalyticEventType.NewPhotoStarted: 'NewPhotoStarted',
  AiutaAnalyticEventType.NewPhotoTaken: 'NewPhotoTaken',
  AiutaAnalyticEventType.NewPhotoUploaded: 'NewPhotoUploaded',
  AiutaAnalyticEventType.TryOnResultsError: 'TryOnResultsError',
  AiutaAnalyticEventType.TryOnResultsShown: 'TryOnResultsShown',
  AiutaAnalyticEventType.FlowExit: 'FlowExit',
  AiutaAnalyticEventType.GeneratedImageShared: 'GeneratedImageShared',
  AiutaAnalyticEventType.ProductLike: 'ProductLike',
  AiutaAnalyticEventType.ProductAddToCart: 'ProductAddToCart',
  AiutaAnalyticEventType.FeedbackPositive: 'FeedbackPositive',
  AiutaAnalyticEventType.FeedbackNegative: 'FeedbackNegative',
  AiutaAnalyticEventType.HistoryScreenClicked: 'HistoryScreenClicked',
  AiutaAnalyticEventType.GalleryPhotoSelected: 'GalleryPhotoSelected',
  AiutaAnalyticEventType.GalleryPhotoDeleted: 'GalleryPhotoDeleted',
};
