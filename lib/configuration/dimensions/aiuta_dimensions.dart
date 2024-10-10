import 'package:json_annotation/json_annotation.dart';

part 'aiuta_dimensions.g.dart';

@JsonSerializable()
class AiutaDimensions {
  // Grabber
  final double? grabberPaddingTop;
  final double? grabberWidth;

  AiutaDimensions({
    required this.grabberPaddingTop,
    required this.grabberWidth,
  });

  // Json staff
  factory AiutaDimensions.fromJson(Map<String, dynamic> json) =>
      _$AiutaDimensionsFromJson(json);

  Map<String, dynamic> toJson() => _$AiutaDimensionsToJson(this);
}
