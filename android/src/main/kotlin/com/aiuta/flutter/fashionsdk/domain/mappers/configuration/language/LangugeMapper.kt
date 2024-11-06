package com.aiuta.flutter.fashionsdk.domain.mappers.configuration.language

import com.aiuta.fashionsdk.tryon.compose.domain.models.AiutaTryOnLanguage
import com.aiuta.fashionsdk.tryon.compose.domain.models.CustomLanguage
import com.aiuta.fashionsdk.tryon.compose.domain.models.EnglishLanguage
import com.aiuta.fashionsdk.tryon.compose.domain.models.RussianLanguage
import com.aiuta.fashionsdk.tryon.compose.domain.models.TurkishLanguage
import com.aiuta.flutter.fashionsdk.domain.models.configuration.language.PlatformAiutaLanguage
import com.aiuta.flutter.fashionsdk.domain.models.configuration.language.PlatformCustomLanguage
import com.aiuta.flutter.fashionsdk.domain.models.configuration.language.PlatformDefaultAiutaLanguages
import com.aiuta.flutter.fashionsdk.domain.models.configuration.language.PlatformStandardLanguage

fun PlatformAiutaLanguage.toAiutaLanguage(): AiutaTryOnLanguage {
    return when (val language = this) {
        is PlatformStandardLanguage -> language.solveLanguage()
        is PlatformCustomLanguage -> language.solveLanguage()
    }
}

private fun PlatformStandardLanguage.solveLanguage(): AiutaTryOnLanguage {
    return when (language) {
        PlatformDefaultAiutaLanguages.ENGLISH -> EnglishLanguage(
            brand = brand,
            termsOfServiceUrl = termsOfServiceUrl,
            privacyPolicyUrl = privacyPolicyUrl,
        )

        PlatformDefaultAiutaLanguages.RUSSIAN -> RussianLanguage(
            brand = brand,
            termsOfServiceUrl = termsOfServiceUrl,
            privacyPolicyUrl = privacyPolicyUrl,
        )

        PlatformDefaultAiutaLanguages.TURKISH -> TurkishLanguage(
            brand = brand,
            termsOfServiceUrl = termsOfServiceUrl,
            privacyPolicyUrl = privacyPolicyUrl,
        )
    }
}

private fun PlatformCustomLanguage.solveLanguage(): AiutaTryOnLanguage {
    return CustomLanguage(
        appBarHistory = appBarHistory,
        appBarSelect = appBarSelect,
        preOnboardingTitle = preOnboardingTitle,
        preOnboardingSubtitle = preOnboardingSubtitle,
        preOnboardingButton = preOnboardingButton,
        onboardingButtonNext = onboardingButtonNext,
        onboardingButtonStart = onboardingButtonStart,
        onboardingPageTryonTopic = onboardingPageTryonTopic,
        onboardingPageTryonSubtopic = onboardingPageTryonSubtopic,
        onboardingPageBestResultTopic = onboardingPageBestResultTopic,
        onboardingPageBestResultSubtopic = onboardingPageBestResultSubtopic,
        onboardingPageConsentTopic = onboardingPageConsentTopic,
        onboardingPageConsentBody = onboardingPageConsentBody,
        onboardingPageConsentAgreePoint = onboardingPageConsentAgreePoint,
        onboardingAppbarTryonPage = onboardingAppbarTryonPage,
        onboardingAppbarBestResultPage = onboardingAppbarBestResultPage,
        onboardingAppbarConsentPage = onboardingAppbarConsentPage,
        imageSelectorUploadButton = imageSelectorUploadButton,
        imageSelectorChangeButton = imageSelectorChangeButton,
        imageSelectorPoweredByAiuta = imageSelectorPoweredByAiuta,
        imageSelectorProtectionPoint = imageSelectorProtectionPoint,
        imageSelectorGeneratingOutfit = loadingGeneratingOutfit,
        historySelectorDisabledButton = historySelectorDisabledButton,
        historySelectorEnableButtonSelectAll = historySelectorEnableButtonSelectAll,
        historySelectorEnableButtonUnselectAll = historySelectorEnableButtonUnselectAll,
        historySelectorEnableButtonCancel = historySelectorEnableButtonCancel,
        historyEmptyDescription = "", // Just ignore it
        generationResultMoreTitle = generationResultMoreTitle,
        generationResultMoreSubtitle = generationResultMoreSubtitle,
        pickerSheetTakePhoto = pickerSheetTakePhoto,
        pickerSheetChooseLibrary = pickerSheetChooseLibrary,
        generatedOperationsSheetPreviously = uploadsHistorySheetPreviously,
        generatedOperationsSheetUploadNewButton = uploadsHistorySheetUploadNewButton,
        feedbackSheetSkip = feedbackSheetSkip,
        feedbackSheetSend = feedbackSheetSend,
        feedbackSheetSendFeedback = feedbackSheetSendFeedback,
        feedbackSheetTitle = feedbackSheetTitle,
        feedbackSheetOptions = feedbackSheetOptions,
        feedbackSheetExtraOption = feedbackSheetExtraOption,
        feedbackSheetExtraOptionTitle = feedbackSheetExtraOptionTitle,
        fitDisclaimerTitle = fitDisclaimerTitle,
        fitDisclaimerBody = fitDisclaimerBody,
        dialogCameraPermissionTitle = dialogCameraPermissionTitle,
        dialogCameraPermissionDescription = dialogCameraPermissionDescription,
        dialogCameraPermissionConfirmButton = dialogCameraPermissionConfirmButton,
        dialogInvalidImageDescription = dialogInvalidImageDescription,
        addToWish = addToWish,
        addToCart = addToCart,
        cancel = cancel,
        close = close,
        tryOn = tryOn,
        tryAgain = tryAgain,
        virtualTryOn = appBarVirtualTryOn,
        share = share,
        defaultErrorMessage = defaultErrorMessage,
    )
}