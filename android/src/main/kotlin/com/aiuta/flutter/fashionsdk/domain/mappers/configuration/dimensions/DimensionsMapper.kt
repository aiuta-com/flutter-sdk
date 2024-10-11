package com.aiuta.flutter.fashionsdk.domain.mappers.configuration.dimensions

import androidx.compose.ui.unit.dp
import com.aiuta.fashionsdk.tryon.compose.domain.models.dimensions.AiutaDimensions
import com.aiuta.flutter.fashionsdk.domain.models.configuration.dimensions.PlatformAiutaDimensions

fun PlatformAiutaDimensions.toAiutaDimensions(): AiutaDimensions {
    return AiutaDimensions(
        grabberPaddingTop = grabberPaddingTop?.dp,
        grabberWidth = grabberWidth?.dp,
    )
}