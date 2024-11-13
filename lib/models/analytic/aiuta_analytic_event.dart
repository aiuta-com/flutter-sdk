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

/// Base class for all analytic events.
sealed class AiutaAnalyticEvent {
  /// Type of the analytic event.
  final AiutaAnalyticEventType type;

  /// Id of the page.
  final AiutaAnalyticPageId pageId;

  /// Id of the product that the user interacts with.
  /// Matches the id of either the product which is passed to the SDK by starting try-on
  final String productId;

  /// Creates an analytic event.
  AiutaAnalyticEvent({
    required this.type,
    required this.pageId,
    required this.productId,
  });

  // Json staff
  /// Creates an analytic event from a JSON object.
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
        return AiutaAnalyticsResultsEvent.fromJson(json);
      case 'feedbackEvent':
        return AiutaAnalyticsFeedbackEvent.fromJson(json);
      case 'historyEvent':
        return AiutaAnalyticsHistoryEvent.fromJson(json);
      default:
        throw Exception('Unknown analytic type');
    }
  }

  /// Converts the analytic event to a JSON object.
  Map<String, dynamic> toJson();
}

/// Event that represents a page view.
/// This event is sent when a user navigates to a new page.
@JsonSerializable()
class AiutaAnalyticPageEvent extends AiutaAnalyticEvent {
  /// Id of the page.
  final AiutaAnalyticPageId pageId;

  /// Id of the product that the user interacts with.
  final String productId;

  /// Creates a page view event.
  AiutaAnalyticPageEvent({
    required this.pageId,
    required this.productId,
  }) : super(
          type: AiutaAnalyticEventType.pageEvent,
          pageId: pageId,
          productId: productId,
        );

  // Json staff
  /// Creates a page view event from a JSON object.
  factory AiutaAnalyticPageEvent.fromJson(Map<String, dynamic> json) =>
      _$AiutaAnalyticPageEventFromJson(json);

  /// Converts the page view event to a JSON object.
  @override
  Map<String, dynamic> toJson() => _$AiutaAnalyticPageEventToJson(this);
}

/// This event is sent when a user interacts with an onboarding screens.
@JsonSerializable()
class AiutaAnalyticOnboardingEvent extends AiutaAnalyticEvent {
  /// Type of the onboarding event.
  final AiutaAnalyticOnboardingEventType event;

  /// Id of the page.
  final AiutaAnalyticPageId pageId;

  /// Id of the product that the user interacts with.
  final String productId;

  /// Creates an onboarding event.
  AiutaAnalyticOnboardingEvent({
    required this.event,
    required this.pageId,
    required this.productId,
  }) : super(
          type: AiutaAnalyticEventType.onboardingEvent,
          pageId: pageId,
          productId: productId,
        );

  // Json staff
  /// Creates an onboarding event from a JSON object.
  factory AiutaAnalyticOnboardingEvent.fromJson(Map<String, dynamic> json) =>
      _$AiutaAnalyticOnboardingEventFromJson(json);

  /// Converts the onboarding event to a JSON object.
  @override
  Map<String, dynamic> toJson() => _$AiutaAnalyticOnboardingEventToJson(this);
}

/// This event is sent when a user interacts with the picker.
/// This includes selecting an uploaded image, taking a photo, choosing gallery image, etc.
@JsonSerializable()
class AiutaAnalyticsPickerEvent extends AiutaAnalyticEvent {
  /// Type of the picker event representing the user action.
  final AiutaAnalyticsPickerEventType event;

  /// Id of the page where the picker is located.
  /// For this event, the pageId is either AiutaAnalyticPageId.imagePicker or AiutaAnalyticPageId.results.
  final AiutaAnalyticPageId pageId;

  /// Id of the product that the user interacts with.
  final String productId;

  /// Creates a picker event.
  AiutaAnalyticsPickerEvent({
    required this.event,
    required this.pageId,
    required this.productId,
  }) : super(
          type: AiutaAnalyticEventType.pickerEvent,
          pageId: pageId,
          productId: productId,
        );

  // Json staff
  /// Creates a picker event from a JSON object.
  factory AiutaAnalyticsPickerEvent.fromJson(Map<String, dynamic> json) =>
      _$AiutaAnalyticsPickerEventFromJson(json);

  /// Converts the picker event to a JSON object.
  @override
  Map<String, dynamic> toJson() => _$AiutaAnalyticsPickerEventToJson(this);
}

/// This event is sent when a user exits the SDK.
/// This includes pressing the back/close button, closing the bottom sheet with the SDK, etc.
@JsonSerializable()
class AiutaAnalyticExitEvent extends AiutaAnalyticEvent {
  /// Id of the page where the exit event is triggered.
  final AiutaAnalyticPageId pageId;

  /// Id of the product that the user interacts with.
  final String productId;

  /// Creates an exit event.
  AiutaAnalyticExitEvent({
    required this.pageId,
    required this.productId,
  }) : super(
          type: AiutaAnalyticEventType.pickerEvent,
          pageId: pageId,
          productId: productId,
        );

  // Json staff
  /// Creates an exit event from a JSON object.
  factory AiutaAnalyticExitEvent.fromJson(Map<String, dynamic> json) =>
      _$AiutaAnalyticExitEventFromJson(json);

  /// Converts the exit event to a JSON object.
  @override
  Map<String, dynamic> toJson() => _$AiutaAnalyticExitEventToJson(this);
}

/// This event is sent when a user is waiting for the try-on to be processed.
@JsonSerializable()
class AiutaAnalyticsTryOnEvent extends AiutaAnalyticEvent {
  /// Type of the try-on event.
  final AiutaAnalyticsTryOnEventType event;

  /// Additional message in case of try on progress
  final String? errorMessage;

  /// Id of the page.
  final AiutaAnalyticPageId pageId;

  /// Id of the product that the user interacts with.
  final String productId;

  /// Creates a try-on event.
  AiutaAnalyticsTryOnEvent({
    required this.event,
    required this.pageId,
    required this.productId,
    this.errorMessage,
  }) : super(
          type: AiutaAnalyticEventType.pickerEvent,
          pageId: pageId,
          productId: productId,
        );

  // Json staff
  /// Creates a try-on event from a JSON object.
  factory AiutaAnalyticsTryOnEvent.fromJson(Map<String, dynamic> json) =>
      _$AiutaAnalyticsTryOnEventFromJson(json);

  /// Converts the try-on event to a JSON object.
  @override
  Map<String, dynamic> toJson() => _$AiutaAnalyticsTryOnEventToJson(this);
}

/// This event is sent when a user interacts with the results screen.
@JsonSerializable()
class AiutaAnalyticsResultsEvent extends AiutaAnalyticEvent {
  /// Type of the results event.
  final AiutaAnalyticsResultsEventType event;

  /// Id of the page.
  final AiutaAnalyticPageId pageId;

  /// Id of the product that the user interacts with.
  /// Matches the id of either the product which is passed to the SDK by starting try-on
  final String productId;

  /// Creates a results event.
  AiutaAnalyticsResultsEvent({
    required this.event,
    required this.pageId,
    required this.productId,
  }) : super(
          type: AiutaAnalyticEventType.pickerEvent,
          pageId: pageId,
          productId: productId,
        );

  // Json staff
  /// Creates a results event from a JSON object.
  factory AiutaAnalyticsResultsEvent.fromJson(Map<String, dynamic> json) =>
      _$AiutaAnalyticsResultsEventFromJson(json);

  /// Converts the results event to a JSON object.
  @override
  Map<String, dynamic> toJson() => _$AiutaAnalyticsResultsEventToJson(this);
}

/// This event is sent when a user provides feedback for generated images.
@JsonSerializable()
class AiutaAnalyticsFeedbackEvent extends AiutaAnalyticEvent {
  /// Type of the feedback event.
  final AiutaAnalyticsFeedbackEventType event;

  /// Index of the negative feedback option if user selects one.
  final int? negativeFeedbackOptionIndex;

  /// Text of the negative feedback if user provides one when selecting the "Other" option.
  /// Or text of the predefined negative feedback option if user selects one.
  /// Or null if user prefers not to provide detailed feedback.
  final String? negativeFeedbackText;

  /// Id of the page.
  final AiutaAnalyticPageId pageId;

  /// Id of the product that the user interacts with.
  final String productId;

  /// Creates a feedback event.
  AiutaAnalyticsFeedbackEvent({
    required this.event,
    required this.pageId,
    required this.productId,
    this.negativeFeedbackOptionIndex,
    this.negativeFeedbackText,
  }) : super(
          type: AiutaAnalyticEventType.pickerEvent,
          pageId: pageId,
          productId: productId,
        );

  // Json staff
  /// Creates a feedback event from a JSON object.
  factory AiutaAnalyticsFeedbackEvent.fromJson(Map<String, dynamic> json) =>
      _$AiutaAnalyticsFeedbackEventFromJson(json);

  /// Converts the feedback event to a JSON object.
  @override
  Map<String, dynamic> toJson() => _$AiutaAnalyticsFeedbackEventToJson(this);
}

/// This event is sent when a user interacts with the try-on history screen.
@JsonSerializable()
class AiutaAnalyticsHistoryEvent extends AiutaAnalyticEvent {
  /// Type of the history event.
  final AiutaAnalyticsHistoryEventType event;

  /// Id of the page.
  final AiutaAnalyticPageId pageId;

  /// Id of the product that the user interacts with.
  final String productId;

  /// Creates a history event.
  AiutaAnalyticsHistoryEvent({
    required this.event,
    required this.pageId,
    required this.productId,
  }) : super(
          type: AiutaAnalyticEventType.pickerEvent,
          pageId: pageId,
          productId: productId,
        );

  // Json staff
  /// Creates a history event from a JSON object.
  factory AiutaAnalyticsHistoryEvent.fromJson(Map<String, dynamic> json) =>
      _$AiutaAnalyticsHistoryEventFromJson(json);

  /// Converts the history event to a JSON object.
  @override
  Map<String, dynamic> toJson() => _$AiutaAnalyticsHistoryEventToJson(this);
}
