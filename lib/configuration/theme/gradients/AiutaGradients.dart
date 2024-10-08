import 'package:json_annotation/json_annotation.dart';

part 'AiutaGradients.g.dart';

@JsonSerializable()
class AiutaGradients {
  final List<String> loadingAnimation;

  AiutaGradients({required this.loadingAnimation});

  // Json staff
  factory AiutaGradients.fromJson(Map<String, dynamic> json) =>
      _$AiutaGradientsFromJson(json);

  Map<String, dynamic> toJson() => _$AiutaGradientsToJson(this);
}
