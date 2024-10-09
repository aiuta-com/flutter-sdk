package com.aiuta.flutter.fashionsdk.domain.models.configuration.mode

import kotlinx.serialization.SerialName
import kotlinx.serialization.Serializable

@Serializable
enum class PlatformAiutaMode {
    @SerialName("fullScreen")
    FULL_SCREEN,

    @SerialName("bottomSheet")
    BOTTOM_SHEET,

    @SerialName("pageSheet")
    PAGE_SHEET
}