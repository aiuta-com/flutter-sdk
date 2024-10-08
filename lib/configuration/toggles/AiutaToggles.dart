import 'dart:ffi';

class AiutaToggles {
  final bool isHistoryAvailable;
  final bool isWishlistAvailable;
  final bool isPreOnboardingAvailable;
  final bool isOnboardingAppBarExtended;
  final bool isMainAppbarReversed;

  AiutaToggles({
    required this.isHistoryAvailable,
    required this.isWishlistAvailable,
    required this.isPreOnboardingAvailable,
    required this.isOnboardingAppBarExtended,
    required this.isMainAppbarReversed,
  });

  factory AiutaToggles.fromJson(Map<String, dynamic> json) {
    return AiutaToggles(
      isHistoryAvailable: json['isHistoryAvailable'],
      isWishlistAvailable: json['isWishlistAvailable'],
      isPreOnboardingAvailable: json['isPreOnboardingAvailable'],
      isOnboardingAppBarExtended: json['isOnboardingAppBarExtended'],
      isMainAppbarReversed: json['isMainAppbarReversed'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'isHistoryAvailable': isHistoryAvailable,
      'isWishlistAvailable': isWishlistAvailable,
      'isPreOnboardingAvailable': isPreOnboardingAvailable,
      'isOnboardingAppBarExtended': isOnboardingAppBarExtended,
      'isMainAppbarReversed': isMainAppbarReversed,
    };
  }
}
