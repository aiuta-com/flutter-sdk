import 'package:json_annotation/json_annotation.dart';

part 'aiuta_icon.g.dart';

@JsonSerializable()
class AiutaIcon {
  /// The path to the icon.
  final String path;

  /// If true, the icon will be rendered as is, without any modifications.
  /// This is useful for icons that are already colored.
  /// If false, the icon will be colored according to the theme.
  /// Default is false.
  final bool shouldRenderAsIs;

  AiutaIcon({
    required this.path,
    this.shouldRenderAsIs = false,
  });

  // Json staff
  factory AiutaIcon.fromJson(Map<String, dynamic> json) =>
      _$AiutaIconFromJson(json);

  Map<String, dynamic> toJson() => _$AiutaIconToJson(this);
}
