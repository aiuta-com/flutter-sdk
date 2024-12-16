package com.aiuta.flutter.fashionsdk.domain.mappers.configuration.meta

import com.aiuta.fashionsdk.tryon.compose.domain.models.configuration.meta.AiutaMode
import com.aiuta.fashionsdk.tryon.compose.domain.models.configuration.meta.HostMetadata
import com.aiuta.flutter.fashionsdk.domain.models.configuration.PlatformAiutaConfiguration
import com.aiuta.flutter.fashionsdk.domain.models.configuration.mode.PlatformAiutaMode

fun PlatformAiutaConfiguration.toHostMetadata(): HostMetadata {
    return HostMetadata(
        mode = mode.toAiutaMode()
    )
}

fun PlatformAiutaMode.toAiutaMode(): AiutaMode {
    return when(this) {
        PlatformAiutaMode.FULL_SCREEN -> AiutaMode.FULL_SCREEN
        PlatformAiutaMode.BOTTOM_SHEET -> AiutaMode.BOTTOM_SHEET
        PlatformAiutaMode.PAGE_SHEET -> AiutaMode.BOTTOM_SHEET
    }
}