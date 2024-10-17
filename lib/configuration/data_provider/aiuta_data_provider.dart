import 'package:aiuta_flutter/configuration/listeners/aiuta_data_listeners.dart';
import 'package:aiuta_flutter/models/images/aiuta_history_image.dart';
import 'package:aiuta_flutter/utils/null_utils.dart';
import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';

part 'aiuta_data_provider.g.dart';

@JsonSerializable()
class AiutaDataProvider {
  @JsonKey(name: "isUserConsentObtained", includeToJson: true)
  bool _isUserConsentObtained;

  @JsonKey(
      name: "isUserConsentObtainedListenable",
      toJson: toNull,
      fromJson: toNull,
      includeIfNull: false,
      includeToJson: false)
  final ValueListenable<bool> isUserConsentObtained;

  @JsonKey(name: "uploadedImages", includeToJson: true)
  List<AiutaUploadedImage>? _uploadedImages;

  @JsonKey(
      name: "uploadedImagesListenable",
      toJson: toNull,
      fromJson: toNull,
      includeIfNull: false,
      includeToJson: false)
  final ValueListenable<List<AiutaUploadedImage>> uploadedImages;

  @JsonKey(name: "generatedImages", includeToJson: true)
  List<AiutaGeneratedImage>? _generatedImages;

  @JsonKey(
      name: "generatedImagesListenable",
      toJson: toNull,
      fromJson: toNull,
      includeIfNull: false,
      includeToJson: false)
  final ValueListenable<List<AiutaGeneratedImage>> generatedImages;

  // Listeners
  // Ignore this in json
  @JsonKey(toJson: toNull, fromJson: toNull, includeIfNull: false)
  final AiutaDataListeners listeners;

  AiutaDataProvider({
    required this.isUserConsentObtained,
    required this.uploadedImages,
    required this.generatedImages,
    required this.listeners,
  })  : _isUserConsentObtained = isUserConsentObtained.value,
        _uploadedImages = uploadedImages.value,
        _generatedImages = generatedImages.value {
    isUserConsentObtained.addListener(() {
      _isUserConsentObtained = isUserConsentObtained.value;
    });
    uploadedImages.addListener(() {
      _uploadedImages = uploadedImages.value;
    });
    generatedImages.addListener(() {
      _generatedImages = generatedImages.value;
    });
  }

  // Json staff
  factory AiutaDataProvider.fromJson(Map<String, dynamic> json) =>
      _$AiutaDataProviderFromJson(json);

  Map<String, dynamic> toJson() => _$AiutaDataProviderToJson(this);
}
