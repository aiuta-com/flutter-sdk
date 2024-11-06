package com.aiuta.flutter.fashionsdk.domain.models.configuration.theme.images

import kotlinx.serialization.SerialName
import kotlinx.serialization.Serializable

@Serializable
class PlatformAiutaOnboardingImages(
    // Try on
    @SerialName("onboardingTryOnMainImage1Path")
    val onboardingTryOnMainImage1Path: String,

    @SerialName("onboardingTryOnMainImage2Path")
    val onboardingTryOnMainImage2Path: String,

    @SerialName("onboardingTryOnMainImage3Path")
    val onboardingTryOnMainImage3Path: String,

    @SerialName("onboardingTryOnItemImage1Path")
    val onboardingTryOnItemImage1Path: String,

    @SerialName("onboardingTryOnItemImage2Path")
    val onboardingTryOnItemImage2Path: String,

    @SerialName("onboardingTryOnItemImage3Path")
    val onboardingTryOnItemImage3Path: String,

    // Best result
    @SerialName("onboardingBestResulBadImage1Path")
    val onboardingBestResulBadImage1Path: String,

    @SerialName("onboardingBestResulBadImage2Path")
    val onboardingBestResulBadImage2Path: String,

    @SerialName("onboardingBestResulGoodImage1Path")
    val onboardingBestResulGoodImage1Path: String,

    @SerialName("onboardingBestResulGoodImage2Path")
    val onboardingBestResulGoodImage2Path: String,
)