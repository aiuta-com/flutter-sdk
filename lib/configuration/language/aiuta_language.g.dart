// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'aiuta_language.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StandardLanguage _$StandardLanguageFromJson(Map<String, dynamic> json) =>
    StandardLanguage(
      language: $enumDecode(_$DefaultAiutaLanguagesEnumMap, json['language']),
      brand: json['brand'] as String,
      termsOfServiceUrl: json['termsOfServiceUrl'] as String,
      privacyPolicyUrl: json['privacyPolicyUrl'] as String,
    )..mode = $enumDecode(_$AiutaLanguageModeEnumMap, json['mode']);

Map<String, dynamic> _$StandardLanguageToJson(StandardLanguage instance) =>
    <String, dynamic>{
      'mode': _$AiutaLanguageModeEnumMap[instance.mode]!,
      'language': _$DefaultAiutaLanguagesEnumMap[instance.language]!,
      'brand': instance.brand,
      'termsOfServiceUrl': instance.termsOfServiceUrl,
      'privacyPolicyUrl': instance.privacyPolicyUrl,
    };

const _$DefaultAiutaLanguagesEnumMap = {
  DefaultAiutaLanguages.english: 'english',
  DefaultAiutaLanguages.turkish: 'turkish',
  DefaultAiutaLanguages.russian: 'russian',
};

const _$AiutaLanguageModeEnumMap = {
  AiutaLanguageMode.standard: 'standard',
  AiutaLanguageMode.custom: 'custom',
};

CustomLanguage _$CustomLanguageFromJson(Map<String, dynamic> json) =>
    CustomLanguage(
      appBarVirtualTryOn: json['appBarVirtualTryOn'] as String,
      appBarHistory: json['appBarHistory'] as String,
      appBarSelect: json['appBarSelect'] as String,
      preOnboardingTitle: json['preOnboardingTitle'] as String,
      preOnboardingSubtitle: json['preOnboardingSubtitle'] as String,
      preOnboardingButton: json['preOnboardingButton'] as String,
      onboardingButtonNext: json['onboardingButtonNext'] as String,
      onboardingButtonStart: json['onboardingButtonStart'] as String,
      onboardingPageTryonTopic: json['onboardingPageTryonTopic'] as String,
      onboardingPageTryonSubtopic:
          json['onboardingPageTryonSubtopic'] as String,
      onboardingPageBestResultTopic:
          json['onboardingPageBestResultTopic'] as String,
      onboardingPageBestResultSubtopic:
          json['onboardingPageBestResultSubtopic'] as String,
      onboardingPageConsentTopic: json['onboardingPageConsentTopic'] as String,
      onboardingPageConsentBody: json['onboardingPageConsentBody'] as String,
      onboardingPageConsentAgreePoint:
          json['onboardingPageConsentAgreePoint'] as String,
      onboardingPageConsentSupplementaryPoints:
          (json['onboardingPageConsentSupplementaryPoints'] as List<dynamic>)
              .map((e) => e as String)
              .toList(),
      onboardingAppbarTryonPage: json['onboardingAppbarTryonPage'] as String,
      onboardingAppbarBestResultPage:
          json['onboardingAppbarBestResultPage'] as String,
      onboardingAppbarConsentPage:
          json['onboardingAppbarConsentPage'] as String,
      imageSelectorUploadButton: json['imageSelectorUploadButton'] as String,
      imageSelectorChangeButton: json['imageSelectorChangeButton'] as String,
      imageSelectorPoweredByAiuta:
          json['imageSelectorPoweredByAiuta'] as String,
      imageSelectorProtectionPoint:
          json['imageSelectorProtectionPoint'] as String,
      loadingUploadingImage: json['loadingUploadingImage'] as String,
      loadingScanningBody: json['loadingScanningBody'] as String,
      loadingGeneratingOutfit: json['loadingGeneratingOutfit'] as String,
      historySelectorEnableButtonSelectAll:
          json['historySelectorEnableButtonSelectAll'] as String,
      historySelectorEnableButtonUnselectAll:
          json['historySelectorEnableButtonUnselectAll'] as String,
      generationResultMoreTitle: json['generationResultMoreTitle'] as String,
      generationResultMoreSubtitle:
          json['generationResultMoreSubtitle'] as String,
      pickerSheetTakePhoto: json['pickerSheetTakePhoto'] as String,
      pickerSheetChooseLibrary: json['pickerSheetChooseLibrary'] as String,
      uploadsHistorySheetPreviously:
          json['uploadsHistorySheetPreviously'] as String,
      uploadsHistorySheetUploadNewButton:
          json['uploadsHistorySheetUploadNewButton'] as String,
      feedbackSheetSkip: json['feedbackSheetSkip'] as String,
      feedbackSheetSend: json['feedbackSheetSend'] as String,
      feedbackSheetSendFeedback: json['feedbackSheetSendFeedback'] as String,
      feedbackSheetTitle: json['feedbackSheetTitle'] as String,
      feedbackSheetOptions: (json['feedbackSheetOptions'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      feedbackSheetExtraOption: json['feedbackSheetExtraOption'] as String,
      feedbackSheetExtraOptionTitle:
          json['feedbackSheetExtraOptionTitle'] as String,
      feedbackSheetGratitude: json['feedbackSheetGratitude'] as String,
      fitDisclaimerTitle: json['fitDisclaimerTitle'] as String,
      fitDisclaimerBody: json['fitDisclaimerBody'] as String,
      dialogCameraPermissionTitle:
          json['dialogCameraPermissionTitle'] as String,
      dialogCameraPermissionDescription:
          json['dialogCameraPermissionDescription'] as String,
      dialogCameraPermissionConfirmButton:
          json['dialogCameraPermissionConfirmButton'] as String,
      dialogInvalidImageDescription:
          json['dialogInvalidImageDescription'] as String,
      addToWish: json['addToWish'] as String,
      addToCart: json['addToCart'] as String,
      cancel: json['cancel'] as String,
      close: json['close'] as String,
      tryOn: json['tryOn'] as String,
      tryAgain: json['tryAgain'] as String,
      share: json['share'] as String,
      defaultErrorMessage: json['defaultErrorMessage'] as String,
    )..mode = $enumDecode(_$AiutaLanguageModeEnumMap, json['mode']);

Map<String, dynamic> _$CustomLanguageToJson(CustomLanguage instance) =>
    <String, dynamic>{
      'mode': _$AiutaLanguageModeEnumMap[instance.mode]!,
      'appBarVirtualTryOn': instance.appBarVirtualTryOn,
      'appBarHistory': instance.appBarHistory,
      'appBarSelect': instance.appBarSelect,
      'preOnboardingTitle': instance.preOnboardingTitle,
      'preOnboardingSubtitle': instance.preOnboardingSubtitle,
      'preOnboardingButton': instance.preOnboardingButton,
      'onboardingButtonNext': instance.onboardingButtonNext,
      'onboardingButtonStart': instance.onboardingButtonStart,
      'onboardingPageTryonTopic': instance.onboardingPageTryonTopic,
      'onboardingPageTryonSubtopic': instance.onboardingPageTryonSubtopic,
      'onboardingPageBestResultTopic': instance.onboardingPageBestResultTopic,
      'onboardingPageBestResultSubtopic':
          instance.onboardingPageBestResultSubtopic,
      'onboardingPageConsentTopic': instance.onboardingPageConsentTopic,
      'onboardingPageConsentBody': instance.onboardingPageConsentBody,
      'onboardingPageConsentAgreePoint':
          instance.onboardingPageConsentAgreePoint,
      'onboardingPageConsentSupplementaryPoints':
          instance.onboardingPageConsentSupplementaryPoints,
      'onboardingAppbarTryonPage': instance.onboardingAppbarTryonPage,
      'onboardingAppbarBestResultPage': instance.onboardingAppbarBestResultPage,
      'onboardingAppbarConsentPage': instance.onboardingAppbarConsentPage,
      'imageSelectorUploadButton': instance.imageSelectorUploadButton,
      'imageSelectorChangeButton': instance.imageSelectorChangeButton,
      'imageSelectorPoweredByAiuta': instance.imageSelectorPoweredByAiuta,
      'imageSelectorProtectionPoint': instance.imageSelectorProtectionPoint,
      'loadingUploadingImage': instance.loadingUploadingImage,
      'loadingScanningBody': instance.loadingScanningBody,
      'loadingGeneratingOutfit': instance.loadingGeneratingOutfit,
      'historySelectorEnableButtonSelectAll':
          instance.historySelectorEnableButtonSelectAll,
      'historySelectorEnableButtonUnselectAll':
          instance.historySelectorEnableButtonUnselectAll,
      'generationResultMoreTitle': instance.generationResultMoreTitle,
      'generationResultMoreSubtitle': instance.generationResultMoreSubtitle,
      'pickerSheetTakePhoto': instance.pickerSheetTakePhoto,
      'pickerSheetChooseLibrary': instance.pickerSheetChooseLibrary,
      'uploadsHistorySheetPreviously': instance.uploadsHistorySheetPreviously,
      'uploadsHistorySheetUploadNewButton':
          instance.uploadsHistorySheetUploadNewButton,
      'feedbackSheetSkip': instance.feedbackSheetSkip,
      'feedbackSheetSend': instance.feedbackSheetSend,
      'feedbackSheetSendFeedback': instance.feedbackSheetSendFeedback,
      'feedbackSheetTitle': instance.feedbackSheetTitle,
      'feedbackSheetOptions': instance.feedbackSheetOptions,
      'feedbackSheetExtraOption': instance.feedbackSheetExtraOption,
      'feedbackSheetExtraOptionTitle': instance.feedbackSheetExtraOptionTitle,
      'feedbackSheetGratitude': instance.feedbackSheetGratitude,
      'fitDisclaimerTitle': instance.fitDisclaimerTitle,
      'fitDisclaimerBody': instance.fitDisclaimerBody,
      'dialogCameraPermissionTitle': instance.dialogCameraPermissionTitle,
      'dialogCameraPermissionDescription':
          instance.dialogCameraPermissionDescription,
      'dialogCameraPermissionConfirmButton':
          instance.dialogCameraPermissionConfirmButton,
      'dialogInvalidImageDescription': instance.dialogInvalidImageDescription,
      'addToWish': instance.addToWish,
      'addToCart': instance.addToCart,
      'cancel': instance.cancel,
      'close': instance.close,
      'tryOn': instance.tryOn,
      'tryAgain': instance.tryAgain,
      'share': instance.share,
      'defaultErrorMessage': instance.defaultErrorMessage,
    };
