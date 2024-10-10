package com.aiuta.flutter.fashionsdk.domain.models.configuration.dimensions

import kotlinx.serialization.SerialName
import kotlinx.serialization.Serializable

// TODO Support on native side
@Serializable
class PlatformAiutaDimensions(
    @SerialName("grabberPaddingTop")
    val grabberPaddingTop: Double? = null,

    @SerialName("grabberWidth")
    val grabberWidth: Double? = null
)