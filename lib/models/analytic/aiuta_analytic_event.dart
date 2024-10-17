import 'package:aiuta_flutter/models/analytic/aiuta_analytic_event_type.dart';
import 'package:aiuta_flutter/models/analytic/aiuta_analytic_onboarding_event_type.dart';
import 'package:aiuta_flutter/models/analytic/aiuta_analytic_page_id.dart';
import 'package:aiuta_flutter/models/analytic/aiuta_analytics_feedback_event_type.dart';
import 'package:aiuta_flutter/models/analytic/aiuta_analytics_history_event_type.dart';
import 'package:aiuta_flutter/models/analytic/aiuta_analytics_picker_event_type.dart';
import 'package:aiuta_flutter/models/analytic/aiuta_analytics_results_event_type.dart';
import 'package:aiuta_flutter/models/analytic/aiuta_analytics_tryon_event_type.dart';
import 'package:json_annotation/json_annotation.dart';

part 'aiuta_analytic_event.g.dart';

sealed class AiutaAnalyticEvent {
  final AiutaAnalyticEventType type;

  AiutaAnalyticEvent(this.type);

  // Json staff
  factory AiutaAnalyticEvent.fromJson(Map<String, dynamic> json) {
    switch (json['type'] as String) {
      case 'pageEvent':
        return AiutaAnalyticPageEvent.fromJson(json);
      case 'onboardingEvent':
        return AiutaAnalyticOnboardingEvent.fromJson(json);
      case 'pickerEvent':
        return AiutaAnalyticsPickerEvent.fromJson(json);
      case 'exitEvent':
        return AiutaAnalyticExitEvent.fromJson(json);
      case 'tryOnEvent':
        return AiutaAnalyticsTryOnEvent.fromJson(json);
      case 'resultsEvent':
        return AiutaAnalyticsTryOnEvent.fromJson(json);
      case 'feedbackEvent':
        return AiutaAnalyticsFeedbackEvent.fromJson(json);
      case 'historyEvent':
        return AiutaAnalyticsHistoryEvent.fromJson(json);
      default:
        throw Exception('Unknown action type');
    }
  }

  Map<String, dynamic> toJson();
}

@JsonSerializable()
class AiutaAnalyticPageEvent extends AiutaAnalyticEvent {
  final AiutaAnalyticPageId pageId;

  AiutaAnalyticPageEvent({
    required this.pageId,
  }) : super(AiutaAnalyticEventType.pageEvent);

  // Json staff
  factory AiutaAnalyticPageEvent.fromJson(Map<String, dynamic> json) =>
      _$AiutaAnalyticPageEventFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$AiutaAnalyticPageEventToJson(this);
}

@JsonSerializable()
class AiutaAnalyticOnboardingEvent extends AiutaAnalyticEvent {
  final AiutaAnalyticOnboardingEventType event;

  AiutaAnalyticOnboardingEvent({
    required this.event,
  }) : super(AiutaAnalyticEventType.onboardingEvent);

  // Json staff
  factory AiutaAnalyticOnboardingEvent.fromJson(Map<String, dynamic> json) =>
      _$AiutaAnalyticOnboardingEventFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$AiutaAnalyticOnboardingEventToJson(this);
}

@JsonSerializable()
class AiutaAnalyticsPickerEvent extends AiutaAnalyticEvent {
  final AiutaAnalyticsPickerEventType event;

  AiutaAnalyticsPickerEvent({
    required this.event,
  }) : super(AiutaAnalyticEventType.pickerEvent);

  // Json staff
  factory AiutaAnalyticsPickerEvent.fromJson(Map<String, dynamic> json) =>
      _$AiutaAnalyticsPickerEventFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$AiutaAnalyticsPickerEventToJson(this);
}

@JsonSerializable()
class AiutaAnalyticExitEvent extends AiutaAnalyticEvent {
  final AiutaAnalyticPageId pageId;

  AiutaAnalyticExitEvent({
    required this.pageId,
  }) : super(AiutaAnalyticEventType.pickerEvent);

  // Json staff
  factory AiutaAnalyticExitEvent.fromJson(Map<String, dynamic> json) =>
      _$AiutaAnalyticExitEventFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$AiutaAnalyticExitEventToJson(this);
}


@JsonSerializable()
class AiutaAnalyticsTryOnEvent extends AiutaAnalyticEvent {
  final AiutaAnalyticsTryOnEventType event;

  AiutaAnalyticsTryOnEvent({
    required this.event,
  }) : super(AiutaAnalyticEventType.pickerEvent);

  // Json staff
  factory AiutaAnalyticsTryOnEvent.fromJson(Map<String, dynamic> json) =>
      _$AiutaAnalyticsTryOnEventFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$AiutaAnalyticsTryOnEventToJson(this);
}


@JsonSerializable()
class AiutaAnalyticsResultsEvent extends AiutaAnalyticEvent {
  final AiutaAnalyticsResultsEventType event;
  final String productId;
  final AiutaAnalyticsPickerEventType? pickerEvent;

  AiutaAnalyticsResultsEvent({
    required this.event,
    required this.productId,
    required this.pickerEvent,
  }) : super(AiutaAnalyticEventType.pickerEvent);

  // Json staff
  factory AiutaAnalyticsResultsEvent.fromJson(Map<String, dynamic> json) =>
      _$AiutaAnalyticsResultsEventFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$AiutaAnalyticsResultsEventToJson(this);
}

@JsonSerializable()
class AiutaAnalyticsFeedbackEvent extends AiutaAnalyticEvent {
  final AiutaAnalyticsFeedbackEventType event;
  final int? negativeFeedbackOptionIndex;
  final String? negativeFeedbackText;

  AiutaAnalyticsFeedbackEvent({
    required this.event,
    this.negativeFeedbackOptionIndex,
    this.negativeFeedbackText,
  }) : super(AiutaAnalyticEventType.pickerEvent);

  // Json staff
  factory AiutaAnalyticsFeedbackEvent.fromJson(Map<String, dynamic> json) =>
      _$AiutaAnalyticsFeedbackEventFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$AiutaAnalyticsFeedbackEventToJson(this);
}

@JsonSerializable()
class AiutaAnalyticsHistoryEvent extends AiutaAnalyticEvent {
  final AiutaAnalyticsHistoryEventType event;

  AiutaAnalyticsHistoryEvent({
    required this.event,
  }) : super(AiutaAnalyticEventType.pickerEvent);

  // Json staff
  factory AiutaAnalyticsHistoryEvent.fromJson(Map<String, dynamic> json) =>
      _$AiutaAnalyticsHistoryEventFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$AiutaAnalyticsHistoryEventToJson(this);
}
