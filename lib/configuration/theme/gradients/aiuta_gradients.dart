import 'package:json_annotation/json_annotation.dart';

part 'aiuta_gradients.g.dart';

@JsonSerializable()
class AiutaGradients {
  final List<String> loadingAnimation;
  final List<String> tryOnButtonBackground;

  AiutaGradients({
    required this.loadingAnimation,
    required this.tryOnButtonBackground,
  });

  // Json staff
  factory AiutaGradients.fromJson(Map<String, dynamic> json) =>
      _$AiutaGradientsFromJson(json);

  Map<String, dynamic> toJson() => _$AiutaGradientsToJson(this);
}
