package com.aiuta.flutter.fashionsdk.domain.models.analytic

import kotlinx.serialization.Serializable

@Serializable
class PlatformAnalyticEvent(
    val name: String,
    val params: Map<String, String?>
)