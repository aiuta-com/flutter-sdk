package com.aiuta.flutter.fashionsdk.domain.models.configuration.theme.images

import kotlinx.serialization.SerialName
import kotlinx.serialization.Serializable

@Serializable
class PlatformAiutaImages(
    @SerialName("preonboardingImagePath")
    val preonboardingImagePath: String? = null,

    @SerialName("onboardingImages")
    val onboardingImages: PlatformAiutaOnboardingImages? = null,

    @SerialName("selectorEmptyImagePath")
    val selectorEmptyImagePath: String? = null,

    @SerialName("feedbackThanksImagePath")
    val feedbackThanksImagePath: String? = null,
)