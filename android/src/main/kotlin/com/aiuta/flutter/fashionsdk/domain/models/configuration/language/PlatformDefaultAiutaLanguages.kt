package com.aiuta.flutter.fashionsdk.domain.models.configuration.language

import kotlinx.serialization.SerialName
import kotlinx.serialization.Serializable

@Serializable
enum class PlatformDefaultAiutaLanguages {
    @SerialName("english")
    ENGLISH,
    @SerialName("turkish")
    TURKISH,
    @SerialName("russian")
    RUSSIAN,
}