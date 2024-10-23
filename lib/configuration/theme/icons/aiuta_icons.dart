import 'package:aiuta_flutter/configuration/theme/icons/aiuta_icon.dart';
import 'package:json_annotation/json_annotation.dart';

part 'aiuta_icons.g.dart';

@JsonSerializable()
class AiutaIcons {
  // x82
  final AiutaIcon preonboarding82;

  // x36
  final AiutaIcon error36;
  final AiutaIcon like36;
  final AiutaIcon dislike36;

  // x24
  final AiutaIcon back24;
  final AiutaIcon camera24;
  final AiutaIcon checkCorrect24;
  final AiutaIcon checkNotCorrect24;
  final AiutaIcon close24;
  final AiutaIcon trash24;
  final AiutaIcon takePhoto24;
  final AiutaIcon history24;
  final AiutaIcon photoLibrary24;
  final AiutaIcon share24;
  final AiutaIcon wishlist24;
  final AiutaIcon wishlistFill24;

  // x20
  final AiutaIcon check20;
  final AiutaIcon info20;

  // x16
  final AiutaIcon magic16;
  final AiutaIcon lock16;
  final AiutaIcon arrow16;

  // x14
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
