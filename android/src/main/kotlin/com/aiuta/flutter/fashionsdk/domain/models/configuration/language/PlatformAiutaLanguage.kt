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
    // Code of language in ISO-639
    @SerialName("languageCode")
    val languageCode: String,

    // App bar
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
    @SerialName("imageSelectorGeneratingOutfit")
    val imageSelectorGeneratingOutfit: String,

    // History
    @SerialName("historySelectorDisabledButton")
    val historySelectorDisabledButton: String,
    @SerialName("historySelectorEnableButtonSelectAll")
    val historySelectorEnableButtonSelectAll: String,
    @SerialName("historySelectorEnableButtonUnselectAll")
    val historySelectorEnableButtonUnselectAll: String,
    @SerialName("historySelectorEnableButtonCancel")
    val historySelectorEnableButtonCancel: String,
    @SerialName("historyEmptyDescription")
    val historyEmptyDescription: String,

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
    @SerialName("generatedOperationsSheetPreviously")
    val generatedOperationsSheetPreviously: String,
    @SerialName("generatedOperationsSheetUploadNewButton")
    val generatedOperationsSheetUploadNewButton: String,

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

    // Dialog
    // Camera permission
    @SerialName("dialogCameraPermissionTitle")
    val dialogCameraPermissionTitle: String,
    @SerialName("dialogCameraPermissionDescription")
    val dialogCameraPermissionDescription: String,
    @SerialName("dialogCameraPermissionConfirmButton")
    val dialogCameraPermissionConfirmButton: String,

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
    @SerialName("virtualTryOn")
    val virtualTryOn: String,
    @SerialName("share")
    val share: String,
    @SerialName("defaultErrorMessage")
    val defaultErrorMessage: String,
) : PlatformAiutaLanguage