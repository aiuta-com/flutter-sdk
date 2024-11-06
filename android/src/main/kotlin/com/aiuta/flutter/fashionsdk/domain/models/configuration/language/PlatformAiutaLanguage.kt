package com.aiuta.flutter.fashionsdk.domain.models.configuration.language

import kotlinx.serialization.ExperimentalSerializationApi
import kotlinx.serialization.SerialName
import kotlinx.serialization.Serializable
import kotlinx.serialization.json.JsonClassDiscriminator

@OptIn(ExperimentalSerializationApi::class)
@Serializable
@JsonClassDiscriminator("mode")
sealed interface PlatformAiutaLanguage {
    companion object {
        const val TYPE_STANDARD = "standard"
        const val TYPE_CUSTOM = "custom"
    }
}


@Serializable
@SerialName(PlatformAiutaLanguage.TYPE_STANDARD)
class PlatformStandardLanguage(
    @SerialName("language")
    val language: PlatformDefaultAiutaLanguages,
    @SerialName("brand")
    val brand: String,
    @SerialName("termsOfServiceUrl")
    val termsOfServiceUrl: String,
    @SerialName("privacyPolicyUrl")
    val privacyPolicyUrl: String,
) : PlatformAiutaLanguage


@Serializable
@SerialName(PlatformAiutaLanguage.TYPE_CUSTOM)
class PlatformCustomLanguage(
    // App bar
    @SerialName("appBarVirtualTryOn")
    val appBarVirtualTryOn: String,
    @SerialName("appBarHistory")
    val appBarHistory: String,
    @SerialName("appBarSelect")
    val appBarSelect: String,

    // Pre Onboarding
    @SerialName("preOnboardingTitle")
    val preOnboardingTitle: String,
    @SerialName("preOnboardingSubtitle")
    val preOnboardingSubtitle: String,
    @SerialName("preOnboardingButton")
    val preOnboardingButton: String,

    // Onboarding
    @SerialName("onboardingButtonNext")
    val onboardingButtonNext: String,
    @SerialName("onboardingButtonStart")
    val onboardingButtonStart: String,
    @SerialName("onboardingPageTryonTopic")
    val onboardingPageTryonTopic: String,
    @SerialName("onboardingPageTryonSubtopic")
    val onboardingPageTryonSubtopic: String,
    @SerialName("onboardingPageBestResultTopic")
    val onboardingPageBestResultTopic: String,
    @SerialName("onboardingPageBestResultSubtopic")
    val onboardingPageBestResultSubtopic: String,
    @SerialName("onboardingPageConsentTopic")
    val onboardingPageConsentTopic: String,
    @SerialName("onboardingPageConsentBody")
    val onboardingPageConsentBody: String,
    @SerialName("onboardingPageConsentAgreePoint")
    val onboardingPageConsentAgreePoint: String,
    @SerialName("onboardingAppbarTryonPage")
    val onboardingAppbarTryonPage: String,
    @SerialName("onboardingAppbarBestResultPage")
    val onboardingAppbarBestResultPage: String,
    @SerialName("onboardingAppbarConsentPage")
    val onboardingAppbarConsentPage: String,

    // Image selector
    @SerialName("imageSelectorUploadButton")
    val imageSelectorUploadButton: String,
    @SerialName("imageSelectorChangeButton")
    val imageSelectorChangeButton: String,
    @SerialName("imageSelectorPoweredByAiuta")
    val imageSelectorPoweredByAiuta: String,
    @SerialName("imageSelectorProtectionPoint")
    val imageSelectorProtectionPoint: String,

    // Loading
    @SerialName("loadingUploadingImage")
    val loadingUploadingImage: String,
    @SerialName("loadingScanningBody")
    val loadingScanningBody: String,
    @SerialName("loadingGeneratingOutfit")
    val loadingGeneratingOutfit: String,

    // History
    @SerialName("historySelectorDisabledButton")
    val historySelectorDisabledButton: String,
    @SerialName("historySelectorEnableButtonSelectAll")
    val historySelectorEnableButtonSelectAll: String,
    @SerialName("historySelectorEnableButtonUnselectAll")
    val historySelectorEnableButtonUnselectAll: String,
    @SerialName("historySelectorEnableButtonCancel")
    val historySelectorEnableButtonCancel: String,

    // Generation Result
    @SerialName("generationResultMoreTitle")
    val generationResultMoreTitle: String,
    @SerialName("generationResultMoreSubtitle")
    val generationResultMoreSubtitle: String,

    // Bottom sheets
    // Picker sheet
    @SerialName("pickerSheetTakePhoto")
    val pickerSheetTakePhoto: String,
    @SerialName("pickerSheetChooseLibrary")
    val pickerSheetChooseLibrary: String,

    // Generated operations sheet
    @SerialName("uploadsHistorySheetPreviously")
    val uploadsHistorySheetPreviously: String,
    @SerialName("uploadsHistorySheetUploadNewButton")
    val uploadsHistorySheetUploadNewButton: String,

    // Feedback sheet
    @SerialName("feedbackSheetSkip")
    val feedbackSheetSkip: String,
    @SerialName("feedbackSheetSend")
    val feedbackSheetSend: String,
    @SerialName("feedbackSheetSendFeedback")
    val feedbackSheetSendFeedback: String,
    @SerialName("feedbackSheetTitle")
    val feedbackSheetTitle: String? = null,
    @SerialName("feedbackSheetOptions")
    val feedbackSheetOptions: List<String>? = null,
    @SerialName("feedbackSheetExtraOption")
    val feedbackSheetExtraOption: String? = null,
    @SerialName("feedbackSheetExtraOptionTitle")
    val feedbackSheetExtraOptionTitle: String? = null,

    // Fit disclaimer
    @SerialName("fitDisclaimerTitle")
    val fitDisclaimerTitle: String,
    @SerialName("fitDisclaimerBody")
    val fitDisclaimerBody: String,

    // Dialog
    // Camera permission
    @SerialName("dialogCameraPermissionTitle")
    val dialogCameraPermissionTitle: String,
    @SerialName("dialogCameraPermissionDescription")
    val dialogCameraPermissionDescription: String,
    @SerialName("dialogCameraPermissionConfirmButton")
    val dialogCameraPermissionConfirmButton: String,

    // Invalid image
    @SerialName("dialogInvalidImageDescription")
    val dialogInvalidImageDescription: String,

    // General
    @SerialName("addToWish")
    val addToWish: String,
    @SerialName("addToCart")
    val addToCart: String,
    @SerialName("cancel")
    val cancel: String,
    @SerialName("close")
    val close: String,
    @SerialName("tryOn")
    val tryOn: String,
    @SerialName("tryAgain")
    val tryAgain: String,
    @SerialName("share")
    val share: String,
    @SerialName("defaultErrorMessage")
    val defaultErrorMessage: String,
) : PlatformAiutaLanguage