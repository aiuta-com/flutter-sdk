package com.aiuta.flutter.fashionsdk.domain.models.configuration.theme.shapes

import kotlinx.serialization.SerialName
import kotlinx.serialization.Serializable

@Serializable
class PlatformAiutaShapes(
    // Images
    @SerialName("mainImage")
    val mainImage: Int,

    @SerialName("onboardingImage")
    val onboardingImage: Int,

    @SerialName("previewImage")
    val previewImage: Int,

    // Bottom sheet
    @SerialName("bottomSheet")
    val bottomSheet: Int,

    // Buttons
    @SerialName("buttonL")
    val buttonL: Int,

    @SerialName("buttonM")
    val buttonM: Int
)