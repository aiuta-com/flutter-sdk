package com.aiuta.flutter.fashionsdk.domain.models.configuration.theme.dimensions

import kotlinx.serialization.SerialName
import kotlinx.serialization.Serializable

@Serializable
class PlatformAiutaDimensions(
    @SerialName("grabberPaddingTop")
    val grabberPaddingTop: Double? = null,

    @SerialName("grabberWidth")
    val grabberWidth: Double? = null
)