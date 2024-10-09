package com.aiuta.flutter.fashionsdk.domain.models.configuration.toggles

import kotlinx.serialization.SerialName
import kotlinx.serialization.Serializable

@Serializable
class PlatformAiutaToggles(
    @SerialName("isHistoryAvailable")
    val isHistoryAvailable: Boolean,

    @SerialName("isWishlistAvailable")
    val isWishlistAvailable: Boolean,

    @SerialName("isOnboardingAppBarExtended")
    val isOnboardingAppBarExtended: Boolean,

    @SerialName("isMainAppbarReversed")
    val isMainAppbarReversed: Boolean
)