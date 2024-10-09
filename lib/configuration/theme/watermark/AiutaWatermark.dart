import 'package:json_annotation/json_annotation.dart';

part 'AiutaWatermark.g.dart';

@JsonSerializable()
class AiutaWatermark {
  final String path;

  AiutaWatermark({
    required this.path,
  });

  // Json staff
  factory AiutaWatermark.fromJson(Map<String, dynamic> json) =>
      _$AiutaWatermarkFromJson(json);

  Map<String, dynamic> toJson() => _$AiutaWatermarkToJson(this);
}
