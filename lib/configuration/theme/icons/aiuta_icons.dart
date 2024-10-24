import 'package:aiuta_flutter/configuration/theme/icons/aiuta_icon.dart';
import 'package:json_annotation/json_annotation.dart';

part 'aiuta_icons.g.dart';

@JsonSerializable()
class AiutaIcons {
  // x82
  /// Splash icon for pre-onboarding screen.
  final AiutaIcon preonboarding82;

  // x36
  /// Icons for error messages.
  final AiutaIcon error36;

  /// Like icon for generated results.
  final AiutaIcon like36;

  /// Dislike icon for generated results.
  final AiutaIcon dislike36;

  // x24
  /// Back icon for navigation.
  final AiutaIcon back24;

  /// Camera icon for photo upload.
  final AiutaIcon camera24;

  /// Onboarding screen icon for correct results.
  final AiutaIcon checkCorrect24;

  /// Onboarding screen icon for incorrect results.
  final AiutaIcon checkNotCorrect24;

  /// AppBar icon for closing the sdk or presented screen.
  final AiutaIcon close24;

  /// Delete icon for uploaded images.
  final AiutaIcon trash24;

  /// Retake photo icon for generated results.
  final AiutaIcon takePhoto24;

  /// AppBar action icon for history.
  final AiutaIcon history24;

  /// Photo library icon for image selection.
  final AiutaIcon photoLibrary24;

  /// Share icon for generated images.
  final AiutaIcon share24;

  /// Wishlist icon for products.
  final AiutaIcon wishlist24;

  /// Filled wishlist icon for products.
  final AiutaIcon wishlistFill24;

  // x20
  /// Checkmark icon for checkboxes and selection.
  final AiutaIcon check20;

  /// Fir disclaimer icon.
  final AiutaIcon info20;

  // x16
  /// Try on button icon.
  final AiutaIcon magic16;

  /// Used in the description of photo upload protection below the Choose photo button.
  final AiutaIcon lock16;

  /// Used in the product details bottom sheet.
  final AiutaIcon arrow16;

  // x14
  /// A loading spinner icon.
  final AiutaIcon loading14;

  AiutaIcons({
    // x82
    required this.preonboarding82,
    // x36
    required this.error36,
    required this.like36,
    required this.dislike36,
    // x24
    required this.back24,
    required this.camera24,
    required this.checkCorrect24,
    required this.checkNotCorrect24,
    required this.close24,
    required this.trash24,
    required this.takePhoto24,
    required this.history24,
    required this.photoLibrary24,
    required this.share24,
    required this.wishlist24,
    required this.wishlistFill24,
    // x20
    required this.check20,
    required this.info20,
    // x16
    required this.magic16,
    required this.lock16,
    required this.arrow16,
    // x14
    required this.loading14,
  });

  // Json staff
  factory AiutaIcons.fromJson(Map<String, dynamic> json) =>
      _$AiutaIconsFromJson(json);

  Map<String, dynamic> toJson() => _$AiutaIconsToJson(this);
}
