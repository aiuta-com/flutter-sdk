import 'package:aiuta_flutter/models/analytic/aiuta_analytic_event_type.dart';
import 'package:json_annotation/json_annotation.dart';

part 'aiuta_analytic_event.g.dart';

@JsonSerializable()
class AiutaAnalyticEvent {
  final AiutaAnalyticEventType type;
  final Map<String, String?> params;

  AiutaAnalyticEvent({
    required this.type,
    required this.params,
  });

  // Json staff
  factory AiutaAnalyticEvent.fromJson(Map<String, dynamic> json) =>
      _$AiutaAnalyticEventFromJson(json);

  Map<String, dynamic> toJson() => _$AiutaAnalyticEventToJson(this);
}
