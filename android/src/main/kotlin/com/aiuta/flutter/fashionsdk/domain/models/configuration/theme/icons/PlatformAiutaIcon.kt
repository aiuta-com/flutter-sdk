package com.aiuta.flutter.fashionsdk.domain.models.configuration.theme.icons

import kotlinx.serialization.SerialName
import kotlinx.serialization.Serializable

@Serializable
class PlatformAiutaIcon(
    @SerialName("path")
    val path: String,

    @SerialName("shouldRenderAsIs")
    val shouldRenderAsIs: Boolean
)