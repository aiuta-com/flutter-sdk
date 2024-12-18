package com.aiuta.flutter.fashionsdk.domain.models.configuration.toggles

import kotlinx.serialization.SerialName
import kotlinx.serialization.Serializable

@Serializable
class PlatformAiutaToggles(
    @SerialName("isHistoryAvailable")
    val isHistoryAvailable: Boolean,

    @SerialName("isWishlistAvailable")
    val isWishlistAvailable: Boolean,

    @SerialName("isPreOnboardingAvailable")
    val isPreOnboardingAvailable: Boolean,

    @SerialName("isShareAvailable")
    val isShareAvailable: Boolean,

    @SerialName("isBackgroundExecutionAllowed")
    val isBackgroundExecutionAllowed: Boolean,
)