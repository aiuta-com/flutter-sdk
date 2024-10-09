package com.aiuta.flutter.fashionsdk.domain.models.configuration.theme.typography

import kotlinx.serialization.SerialName
import kotlinx.serialization.Serializable

@Serializable
enum class PlatformAiutaFontWeight {
    @SerialName("thin")
    THIN,

    @SerialName("extralight")
    EXTRALIGHT,

    @SerialName("light")
    LIGHT,

    @SerialName("normal")
    NORMAL,

    @SerialName("medium")
    MEDIUM,

    @SerialName("semibold")
    SEMIBOLD,

    @SerialName("bold")
    BOLD,

    @SerialName("extrabold")
    EXTRABOLD,

    @SerialName("black")
    BLACK,
}