package com.aiuta.flutter.fashionsdk.domain.models.error

import kotlinx.serialization.SerialName
import kotlinx.serialization.Serializable

@Serializable
class PlatformAiutaError(
    @SerialName("errorType")
    val errorType: PlatformAiutaErrorType
)