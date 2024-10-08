import 'package:aiutasdk/configuration/language/AiutaLanguageMode.dart';
import 'package:aiutasdk/configuration/language/DefaultAiutaLanguages.dart';
import 'package:json_annotation/json_annotation.dart';

part 'AiutaLanguage.g.dart';

sealed class AiutaLanguage {
  AiutaLanguageMode mode;

  AiutaLanguage(this.mode);

  // Json staff
  factory AiutaLanguage.fromJson(Map<String, dynamic> json) {
    switch (json['mode'] as String) {
      case 'standart':
        return StandartLanguage.fromJson(json);
      case 'custom':
        return CustomLanguage.fromJson(json);
      default:
        throw Exception('Unknown language type');
    }
  }

  Map<String, dynamic> toJson();
}

@JsonSerializable()
class StandartLanguage extends AiutaLanguage {
  final DefaultAiutaLanguages language;

  StandartLanguage({required this.language})
      : super(AiutaLanguageMode.standart);

  // Json staff
  factory StandartLanguage.fromJson(Map<String, dynamic> json) =>
      _$StandartLanguageFromJson(json);

  Map<String, dynamic> toJson() => _$StandartLanguageToJson(this);
}

@JsonSerializable()
class CustomLanguage extends AiutaLanguage {
  // Code of language in ISO-639
  final String languageCode;

  // App bar
  final String appBarHistory;
  final String appBarSelect;

  // Pre Onboarding
  final String preOnboardingTitle;
  final String preOnboardingSubtitle;
  final String preOnboardingButton;

  // Onboarding
  final String onboardingButtonNext;
  final String onboardingButtonStart;
  final String onboardingPageTryonTopic;
  final String onboardingPageTryonSubtopic;
  final String onboardingPageBestResultTopic;
  final String onboardingPageBestResultSubtopic;
  final String onboardingPageConsentTopic;
  final String onboardingPageConsentBody;
  final String onboardingPageConsentAgreePoint;
  final String onboardingAppbarTryonPage;
  final String onboardingAppbarBestResultPage;
  final String onboardingAppbarConsentPage;

  // Image selector
  final String imageSelectorUploadButton;
  final String imageSelectorChangeButton;
  final String imageSelectorPoweredByAiuta;
  final String imageSelectorProtectionPoint;
  final String imageSelectorGeneratingOutfit;

  // History
  final String historySelectorDisabledButton;
  final String historySelectorEnableButtonSelectAll;
  final String historySelectorEnableButtonUnselectAll;
  final String historySelectorEnableButtonCancel;
  final String historyEmptyDescription;

  // Generation Result
  final String generationResultMoreTitle;
  final String generationResultMoreSubtitle;

  // Bottom sheets
  // Picker sheet
  final String pickerSheetTakePhoto;
  final String pickerSheetChooseLibrary;

  // Generated operations sheet
  final String generatedOperationsSheetPreviously;
  final String generatedOperationsSheetUploadNewButton;

  // Feedback sheet
  final String feedbackSheetSkip;
  final String feedbackSheetSend;
  final String feedbackSheetSendFeedback;

  // Dialog
  // Camera permission
  final String dialogCameraPermissionTitle;
  final String dialogCameraPermissionDescription;
  final String dialogCameraPermissionConfirmButton;

  // General
  final String addToWish;
  final String addToCart;
  final String cancel;
  final String close;
  final String tryOn;
  final String tryAgain;
  final String virtualTryOn;
  final String share;
  final String defaultErrorMessage;

  CustomLanguage({
    required this.languageCode,
    // App bar
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
    required this.imageSelectorGeneratingOutfit,
    // History
    required this.historySelectorDisabledButton,
    required this.historySelectorEnableButtonSelectAll,
    required this.historySelectorEnableButtonUnselectAll,
    required this.historySelectorEnableButtonCancel,
    required this.historyEmptyDescription,
    // Generation Result
    required this.generationResultMoreTitle,
    required this.generationResultMoreSubtitle,
    // Bottom sheets
    // Picker sheet
    required this.pickerSheetTakePhoto,
    required this.pickerSheetChooseLibrary,
    // Generated operations sheet
    required this.generatedOperationsSheetPreviously,
    required this.generatedOperationsSheetUploadNewButton,
    // Feedback sheet
    required this.feedbackSheetSkip,
    required this.feedbackSheetSend,
    required this.feedbackSheetSendFeedback,
    // Dialog
    // Camera permission
    required this.dialogCameraPermissionTitle,
    required this.dialogCameraPermissionDescription,
    required this.dialogCameraPermissionConfirmButton,
    // General
    required this.addToWish,
    required this.addToCart,
    required this.cancel,
    required this.close,
    required this.tryOn,
    required this.tryAgain,
    required this.virtualTryOn,
    required this.share,
    required this.defaultErrorMessage,
  }) : super(AiutaLanguageMode.custom);

  // Json staff
  factory CustomLanguage.fromJson(Map<String, dynamic> json) =>
      _$CustomLanguageFromJson(json);

  Map<String, dynamic> toJson() => _$CustomLanguageToJson(this);
}
