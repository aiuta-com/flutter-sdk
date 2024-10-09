import 'package:json_annotation/json_annotation.dart';

part 'aiuta_icon.g.dart';

@JsonSerializable()
class AiutaIcon {
  final String path;
  final bool shouldRenderAsIs;

  AiutaIcon({
    required this.path,
    required this.shouldRenderAsIs,
  });

  // Json staff
  factory AiutaIcon.fromJson(Map<String, dynamic> json) =>
      _$AiutaIconFromJson(json);

  Map<String, dynamic> toJson() => _$AiutaIconToJson(this);
}
