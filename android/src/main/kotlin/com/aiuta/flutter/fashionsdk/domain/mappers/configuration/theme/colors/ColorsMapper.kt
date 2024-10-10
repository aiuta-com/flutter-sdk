package com.aiuta.flutter.fashionsdk.domain.mappers.configuration.theme.colors

import com.aiuta.fashionsdk.compose.tokens.color.AiutaColors
import com.aiuta.flutter.fashionsdk.domain.models.configuration.theme.colors.PlatformAiutaColors

fun PlatformAiutaColors.toAiutaColors(): AiutaColors {
    return AiutaColors(
        primary = primary.toColor(),
        secondary = secondary.toColor(),
        tertiary = tertiary.toColor(),
        onDark = onDark.toColor(),
        onError = onError.toColor(),
        brand = brand.toColor(),
        accent = accent.toColor(),
        error = error.toColor(),
        aiuta = aiuta.toColor(),
        background = background.toColor(),
        neutral = neutral.toColor(),
        neutral2 = neutral2.toColor(),
        neutral3 = neutral3.toColor()
    )
}
