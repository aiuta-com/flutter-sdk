package com.aiuta.flutter.fashionsdk.domain.models.configuration.theme.toggles

import kotlinx.serialization.SerialName
import kotlinx.serialization.Serializable

@Serializable
class PlatformAiutaThemeToggles(
    @SerialName("isOnboardingAppBarExtended")
    val isOnboardingAppBarExtended: Boolean,

    @SerialName("isMainAppbarReversed")
    val isMainAppbarReversed: Boolean,

    @SerialName("isShadowsReduced")
    val isShadowsReduced: Boolean,

    @SerialName("isDelimitersExtended")
    val isDelimitersExtended: Boolean
)