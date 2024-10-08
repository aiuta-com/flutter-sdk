import 'package:json_annotation/json_annotation.dart';

import 'AiutaFontWeight.dart';

part 'AiutaFont.g.dart';

@JsonSerializable()
class AiutaFont {
  final String path;
  final AiutaFontWeight weight;

  AiutaFont({
    required this.path,
    required this.weight,
  });

  // Json staff
  factory AiutaFont.fromJson(Map<String, dynamic> json) =>
      _$AiutaFontFromJson(json);

  Map<String, dynamic> toJson() => _$AiutaFontToJson(this);
}
