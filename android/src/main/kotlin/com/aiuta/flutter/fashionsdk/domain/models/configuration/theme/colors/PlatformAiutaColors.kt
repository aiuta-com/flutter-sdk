package com.aiuta.flutter.fashionsdk.domain.models.configuration.theme.colors

import kotlinx.serialization.SerialName
import kotlinx.serialization.Serializable

@Serializable
class PlatformAiutaColors(
    // Text
    @SerialName("primary")
    val primary: String,

    @SerialName("secondary")
    val secondary: String,

    @SerialName("tertiary")
    val tertiary: String,

    @SerialName("onDark")
    val onDark: String,

    @SerialName("onError")
    val onError: String,

    // Brand
    @SerialName("brand")
    val brand: String,

    @SerialName("accent")
    val accent: String,

    @SerialName("error")
    val error: String,

    // Aiuta
    @SerialName("aiuta")
    val aiuta: String,

    // Background
    @SerialName("background")
    val background: String,

    // Other
    @SerialName("neutral")
    val neutral: String,

    @SerialName("neutral2")
    val neutral2: String,

    @SerialName("neutral3")
    val neutral3: String
)