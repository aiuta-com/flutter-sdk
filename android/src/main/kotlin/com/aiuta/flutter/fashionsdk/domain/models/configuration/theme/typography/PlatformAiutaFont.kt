package com.aiuta.flutter.fashionsdk.domain.models.configuration.theme.typography

import kotlinx.serialization.SerialName
import kotlinx.serialization.Serializable

@Serializable
class PlatformAiutaFont(
    @SerialName("filePath")
    val filePath: String,

    @SerialName("family")
    val family: String,

    @SerialName("weight")
    val weight: PlatformAiutaFontWeight,
)