// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'aiuta_language.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StandardLanguage _$StandardLanguageFromJson(Map<String, dynamic> json) =>
    StandardLanguage(
      language: $enumDecode(_$DefaultAiutaLanguagesEnumMap, json['language']),
    )..mode = $enumDecode(_$AiutaLanguageModeEnumMap, json['mode']);

Map<String, dynamic> _$StandardLanguageToJson(StandardLanguage instance) =>
    <String, dynamic>{
      'mode': _$AiutaLanguageModeEnumMap[instance.mode]!,
      'language': _$DefaultAiutaLanguagesEnumMap[instance.language]!,
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
      languageCode: json['languageCode'] as String,
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
      imageSelectorGeneratingOutfit:
          json['imageSelectorGeneratingOutfit'] as String,
      historySelectorDisabledButton:
          json['historySelectorDisabledButton'] as String,
      historySelectorEnableButtonSelectAll:
          json['historySelectorEnableButtonSelectAll'] as String,
      historySelectorEnableButtonUnselectAll:
          json['historySelectorEnableButtonUnselectAll'] as String,
      historySelectorEnableButtonCancel:
          json['historySelectorEnableButtonCancel'] as String,
      historyEmptyDescription: json['historyEmptyDescription'] as String,
      generationResultMoreTitle: json['generationResultMoreTitle'] as String,
      generationResultMoreSubtitle:
          json['generationResultMoreSubtitle'] as String,
      pickerSheetTakePhoto: json['pickerSheetTakePhoto'] as String,
      pickerSheetChooseLibrary: json['pickerSheetChooseLibrary'] as String,
      generatedOperationsSheetPreviously:
          json['generatedOperationsSheetPreviously'] as String,
      generatedOperationsSheetUploadNewButton:
          json['generatedOperationsSheetUploadNewButton'] as String,
      feedbackSheetSkip: json['feedbackSheetSkip'] as String,
      feedbackSheetSend: json['feedbackSheetSend'] as String,
      feedbackSheetSendFeedback: json['feedbackSheetSendFeedback'] as String,
      dialogCameraPermissionTitle:
          json['dialogCameraPermissionTitle'] as String,
      dialogCameraPermissionDescription:
          json['dialogCameraPermissionDescription'] as String,
      dialogCameraPermissionConfirmButton:
          json['dialogCameraPermissionConfirmButton'] as String,
      addToWish: json['addToWish'] as String,
      addToCart: json['addToCart'] as String,
      cancel: json['cancel'] as String,
      close: json['close'] as String,
      tryOn: json['tryOn'] as String,
      tryAgain: json['tryAgain'] as String,
      virtualTryOn: json['virtualTryOn'] as String,
      share: json['share'] as String,
      defaultErrorMessage: json['defaultErrorMessage'] as String,
    )..mode = $enumDecode(_$AiutaLanguageModeEnumMap, json['mode']);

Map<String, dynamic> _$CustomLanguageToJson(CustomLanguage instance) =>
    <String, dynamic>{
      'mode': _$AiutaLanguageModeEnumMap[instance.mode]!,
      'languageCode': instance.languageCode,
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
      'onboardingAppbarTryonPage': instance.onboardingAppbarTryonPage,
      'onboardingAppbarBestResultPage': instance.onboardingAppbarBestResultPage,
      'onboardingAppbarConsentPage': instance.onboardingAppbarConsentPage,
      'imageSelectorUploadButton': instance.imageSelectorUploadButton,
      'imageSelectorChangeButton': instance.imageSelectorChangeButton,
      'imageSelectorPoweredByAiuta': instance.imageSelectorPoweredByAiuta,
      'imageSelectorProtectionPoint': instance.imageSelectorProtectionPoint,
      'imageSelectorGeneratingOutfit': instance.imageSelectorGeneratingOutfit,
      'historySelectorDisabledButton': instance.historySelectorDisabledButton,
      'historySelectorEnableButtonSelectAll':
          instance.historySelectorEnableButtonSelectAll,
      'historySelectorEnableButtonUnselectAll':
          instance.historySelectorEnableButtonUnselectAll,
      'historySelectorEnableButtonCancel':
          instance.historySelectorEnableButtonCancel,
      'historyEmptyDescription': instance.historyEmptyDescription,
      'generationResultMoreTitle': instance.generationResultMoreTitle,
      'generationResultMoreSubtitle': instance.generationResultMoreSubtitle,
      'pickerSheetTakePhoto': instance.pickerSheetTakePhoto,
      'pickerSheetChooseLibrary': instance.pickerSheetChooseLibrary,
      'generatedOperationsSheetPreviously':
          instance.generatedOperationsSheetPreviously,
      'generatedOperationsSheetUploadNewButton':
          instance.generatedOperationsSheetUploadNewButton,
      'feedbackSheetSkip': instance.feedbackSheetSkip,
      'feedbackSheetSend': instance.feedbackSheetSend,
      'feedbackSheetSendFeedback': instance.feedbackSheetSendFeedback,
      'dialogCameraPermissionTitle': instance.dialogCameraPermissionTitle,
      'dialogCameraPermissionDescription':
          instance.dialogCameraPermissionDescription,
      'dialogCameraPermissionConfirmButton':
          instance.dialogCameraPermissionConfirmButton,
      'addToWish': instance.addToWish,
      'addToCart': instance.addToCart,
      'cancel': instance.cancel,
      'close': instance.close,
      'tryOn': instance.tryOn,
      'tryAgain': instance.tryAgain,
      'virtualTryOn': instance.virtualTryOn,
      'share': instance.share,
      'defaultErrorMessage': instance.defaultErrorMessage,
    };
