package com.aiuta.flutter.fashionsdk.domain.models.configuration.theme.typography

import kotlinx.serialization.SerialName
import kotlinx.serialization.Serializable

@Serializable
class PlatformAiutaTextStyle(
    @SerialName("fontFamily")
    val fontFamily: String,

    @SerialName("fontSize")
    val fontSize: Double,

    @SerialName("fontWeight")
    val fontWeight: PlatformAiutaFontWeight,

    @SerialName("letterSpacing")
    val letterSpacing: Double,

    @SerialName("lineHeight")
    val lineHeight: Double,
)