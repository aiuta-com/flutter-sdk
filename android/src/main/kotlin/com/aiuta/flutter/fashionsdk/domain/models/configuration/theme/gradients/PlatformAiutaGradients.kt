package com.aiuta.flutter.fashionsdk.domain.models.configuration.theme.gradients

import kotlinx.serialization.SerialName
import kotlinx.serialization.Serializable


@Serializable
class PlatformAiutaGradients(
    @SerialName("loadingAnimation")
    val loadingAnimation: List<String>
)