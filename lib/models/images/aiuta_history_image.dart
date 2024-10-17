import 'package:json_annotation/json_annotation.dart';

part 'aiuta_history_image.g.dart';

sealed class AiutaHistoryImage {
  final String url;

  AiutaHistoryImage(this.url);

  Map<String, dynamic> toJson();
}

@JsonSerializable()
class AiutaUploadedImage extends AiutaHistoryImage {
  final String id;

  AiutaUploadedImage({
    required this.id,
    required String url,
  }) : super(url);

  factory AiutaUploadedImage.fromJson(Map<String, dynamic> json) =>
      _$AiutaUploadedImageFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$AiutaUploadedImageToJson(this);
}

@JsonSerializable()
class AiutaGeneratedImage extends AiutaHistoryImage {
  AiutaGeneratedImage({
    required String url,
  }) : super(url);

  factory AiutaGeneratedImage.fromJson(Map<String, dynamic> json) =>
      _$AiutaGeneratedImageFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$AiutaGeneratedImageToJson(this);
}
