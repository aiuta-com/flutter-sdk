import 'package:json_annotation/json_annotation.dart';

part 'aiuta_history_image.g.dart';

/// General image model of any history flows
@JsonSerializable()
class AiutaHistoryImage {
  /// ID of the uploaded image.
  final String id;

  /// URL of the image.
  final String url;

  /// Creates an AiutaHistoryImage with the given URL and id.
  AiutaHistoryImage({
    required this.id,
    required this.url,
  });

  /// Converts the JSON object to an AiutaHistoryImage.
  factory AiutaHistoryImage.fromJson(Map<String, dynamic> json) =>
      _$AiutaHistoryImageFromJson(json);

  /// Converts the AiutaHistoryImage to a JSON object.
  Map<String, dynamic> toJson() => _$AiutaHistoryImageToJson(this);
}
