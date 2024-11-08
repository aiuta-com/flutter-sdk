import 'package:aiuta_flutter/configuration/language/aiuta_language_mode.dart';
import 'package:aiuta_flutter/configuration/language/default_aiuta_languages.dart';
import 'package:json_annotation/json_annotation.dart';

part 'aiuta_language.g.dart';

/// Base class for language configuration.
sealed class AiutaLanguage {
  /// Mode of the language configuration.
  AiutaLanguageMode mode;

  /// Creates a language configuration with the given mode.
  AiutaLanguage(this.mode);

  // Json staff
  /// Creates a language configuration from the given JSON map.
  factory AiutaLanguage.fromJson(Map<String, dynamic> json) {
    switch (json['mode'] as String) {
      case 'standard':
        return StandardLanguage.fromJson(json);
      case 'custom':
        return CustomLanguage.fromJson(json);
      default:
        throw Exception('Unknown language type');
    }
  }

  /// Converts this object to a JSON map.
  Map<String, dynamic> toJson();
}

/// Standard language configuration.
/// This configuration uses the built-in localization provided by the Aiuta SDK.
/// You should provide the terms of service and privacy policy URLs.
/// As well as your brand name.
@JsonSerializable()
class StandardLanguage extends AiutaLanguage {
  /// Built-in language to use.
  final DefaultAiutaLanguages language;

  /// Your brand name.
  final String brand;

  /// URL to the terms of service.
  final String termsOfServiceUrl;

  /// URL to the privacy policy.
  final String privacyPolicyUrl;

  /// Creates a standard language configuration with the given parameters.
  StandardLanguage({
    required this.language,
    required this.brand,
    required this.termsOfServiceUrl,
    required this.privacyPolicyUrl,
  }) : super(AiutaLanguageMode.standard);

  // Json staff
  /// Creates a standard language configuration from the given JSON map.
  factory StandardLanguage.fromJson(Map<String, dynamic> json) =>
      _$StandardLanguageFromJson(json);

  /// Converts this object to a JSON map.
  @override
  Map<String, dynamic> toJson() => _$StandardLanguageToJson(this);
}

/// Custom language configuration.
/// This configuration allows you to provide custom localization.
/// You should provide all the necessary strings for the Aiuta SDK.
@JsonSerializable()
class CustomLanguage extends AiutaLanguage {
  // App bar
  /// `Virtual Try-on`
  final String appBarVirtualTryOn;

  /// `History`
  final String appBarHistory;

  /// `Select`
  final String appBarSelect;

  // Pre Onboarding
  /// `Try on you`
  final String preOnboardingTitle;

  /// ```
  /// Welcome to our Virtual try-on.
  /// Try on the item directly
  /// on your photo
  /// ```
  final String preOnboardingSubtitle;

  /// `Let’s start`
  final String preOnboardingButton;

  // Onboarding
  /// `Next`
  final String onboardingButtonNext;

  /// `Start`
  final String onboardingButtonStart;

  /// `Try on before buying`
  final String onboardingPageTryonTopic;

  /// `Upload a photo and see how items look on you`
  final String onboardingPageTryonSubtopic;

  /// `For best results`
  final String onboardingPageBestResultTopic;

  /// `Use a photo with good lighting, stand straight a plain background`
  final String onboardingPageBestResultSubtopic;

  /// `Consent`
  final String onboardingPageConsentTopic;

  /// ```
  /// In order to try on items digitally, you agree to allow YOUR_COMPANY to process your photo.
  /// Your data will be processed according to the YOUR_COMPANY <b><a href='PP_URL'>Privacy Notice</a></b>
  /// and <b><a href='TOS_URL'>Terms of Use.</a></b>
  /// ```
  /// Supports HTML tags.
  final String onboardingPageConsentBody;

  /// `I agree to allow YOUR_COMPANY to process my photo`
  final String onboardingPageConsentAgreePoint;

  /// `<b>Step 1/3</b> - How it works`
  /// Supports HTML tags.
  final String onboardingAppbarTryonPage;

  /// `<b>Step 2/3</b> - For best result`
  /// Supports HTML tags.
  final String onboardingAppbarBestResultPage;

  /// `<b>Step 3/3</b> - Consent`
  /// Supports HTML tags.
  final String onboardingAppbarConsentPage;

  // Image selector
  /// `Upload a photo of you`
  final String imageSelectorUploadButton;

  /// `Change photo`
  final String imageSelectorChangeButton;

  /// `Powered by Aiuta`
  final String imageSelectorPoweredByAiuta;

  /// `Your photos are protected and visible only to you`
  final String imageSelectorProtectionPoint;

  // Loading
  /// `Uploading image`
  final String loadingUploadingImage;

  /// `Scanning your body`
  final String loadingScanningBody;

  /// `Generating outfit`
  final String loadingGeneratingOutfit;

  // History
  /// `Select`
  final String historySelectorDisabledButton;

  /// `Select all`
  final String historySelectorEnableButtonSelectAll;

  /// `Unselect all`
  final String historySelectorEnableButtonUnselectAll;

  /// `Cancel`
  final String historySelectorEnableButtonCancel;

  // Generation Result
  /// `You might also like`
  final String generationResultMoreTitle;

  /// `More for you to try on`
  final String generationResultMoreSubtitle;

  // Bottom sheets
  // Picker sheet
  /// `Take a photo`
  final String pickerSheetTakePhoto;

  /// `Choose from library`
  final String pickerSheetChooseLibrary;

  // Uploads history sheet
  /// `Previously used photos`
  final String uploadsHistorySheetPreviously;

  /// `+ Upload new photo`
  final String uploadsHistorySheetUploadNewButton;

  // Feedback sheet
  /// `Skip`
  final String feedbackSheetSkip;

  /// `Send`
  final String feedbackSheetSend;

  /// `Send feedback`
  final String feedbackSheetSendFeedback;

  /// `Can you tell us more?`
  final String feedbackSheetTitle;

  /// ```
  /// This style isn’t for me
  /// The item looks off
  /// I look different
  /// ```
  final List<String> feedbackSheetOptions;

  /// `Other`
  final String feedbackSheetExtraOption;

  /// `Tell us what we could improve?`
  final String feedbackSheetExtraOptionTitle;

  /// `Thank you for your feedback`
  final String feedbackSheetGratitude;

  // Fit disclaimer
  /// `Results may vary from real-life fit`
  final String fitDisclaimerTitle;

  /// ```
  /// Virtual try-on is a visualization tool that shows
  /// how items might look and may not perfectly represent
  /// how the item will fit in reality
  /// ```
  final String fitDisclaimerBody;

  // Dialog
  // Camera permission
  /// `Camera permission`
  final String dialogCameraPermissionTitle;

  /// `Please allow access to the camera in the application settings`
  final String dialogCameraPermissionDescription;

  /// `Settings`
  final String dialogCameraPermissionConfirmButton;

  // Invalid image
  /// `We couldn’t detect anyone in this photo`
  final String dialogInvalidImageDescription;

  // General
  /// `Wishlist`
  final String addToWish;

  /// `Add to cart`
  final String addToCart;

  /// `Cancel`
  final String cancel;

  /// `Close`
  final String close;

  /// `Try on`
  final String tryOn;

  /// `Try again`
  final String tryAgain;

  /// `Share`
  final String share;

  /// ```
  /// Something went wrong.
  /// Please try again later
  /// ```
  final String defaultErrorMessage;

  /// Creates a custom language configuration with the given parameters.
  CustomLanguage({
    // App bar
    required this.appBarVirtualTryOn,
    required this.appBarHistory,
    required this.appBarSelect,
    // Pre Onboarding
    required this.preOnboardingTitle,
    required this.preOnboardingSubtitle,
    required this.preOnboardingButton,
    // Onboarding
    required this.onboardingButtonNext,
    required this.onboardingButtonStart,
    required this.onboardingPageTryonTopic,
    required this.onboardingPageTryonSubtopic,
    required this.onboardingPageBestResultTopic,
    required this.onboardingPageBestResultSubtopic,
    required this.onboardingPageConsentTopic,
    required this.onboardingPageConsentBody,
    required this.onboardingPageConsentAgreePoint,
    required this.onboardingAppbarTryonPage,
    required this.onboardingAppbarBestResultPage,
    required this.onboardingAppbarConsentPage,
    // Image selector
    required this.imageSelectorUploadButton,
    required this.imageSelectorChangeButton,
    required this.imageSelectorPoweredByAiuta,
    required this.imageSelectorProtectionPoint,
    // Loading
    required this.loadingUploadingImage,
    required this.loadingScanningBody,
    required this.loadingGeneratingOutfit,
    // History
    required this.historySelectorDisabledButton,
    required this.historySelectorEnableButtonSelectAll,
    required this.historySelectorEnableButtonUnselectAll,
    required this.historySelectorEnableButtonCancel,
    // Generation Result
    required this.generationResultMoreTitle,
    required this.generationResultMoreSubtitle,
    // Bottom sheets
    required this.pickerSheetTakePhoto,
    required this.pickerSheetChooseLibrary,
    // Uploads history sheet
    required this.uploadsHistorySheetPreviously,
    required this.uploadsHistorySheetUploadNewButton,
    // Feedback sheet
    required this.feedbackSheetSkip,
    required this.feedbackSheetSend,
    required this.feedbackSheetSendFeedback,
    required this.feedbackSheetTitle,
    required this.feedbackSheetOptions,
    required this.feedbackSheetExtraOption,
    required this.feedbackSheetExtraOptionTitle,
    required this.feedbackSheetGratitude,
    // Fit disclaimer
    required this.fitDisclaimerTitle,
    required this.fitDisclaimerBody,
    // Dialog
    required this.dialogCameraPermissionTitle,
    required this.dialogCameraPermissionDescription,
    required this.dialogCameraPermissionConfirmButton,
    // Invalid image
    required this.dialogInvalidImageDescription,
    // General
    required this.addToWish,
    required this.addToCart,
    required this.cancel,
    required this.close,
    required this.tryOn,
    required this.tryAgain,
    required this.share,
    required this.defaultErrorMessage,
  }) : super(AiutaLanguageMode.custom);

  // Json staff
  /// Creates a custom language configuration from the given JSON map.
  factory CustomLanguage.fromJson(Map<String, dynamic> json) =>
      _$CustomLanguageFromJson(json);

  /// Converts this object to a JSON map.
  @override
  Map<String, dynamic> toJson() => _$CustomLanguageToJson(this);
}
