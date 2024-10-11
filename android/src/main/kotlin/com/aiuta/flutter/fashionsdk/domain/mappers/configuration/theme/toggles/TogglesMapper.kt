package com.aiuta.flutter.fashionsdk.domain.mappers.configuration.theme.toggles

import com.aiuta.fashionsdk.compose.tokens.toggles.AiutaThemeToggles
import com.aiuta.fashionsdk.compose.tokens.toggles.aiutaThemeToggles
import com.aiuta.flutter.fashionsdk.domain.models.configuration.theme.toggles.PlatformAiutaThemeToggles

fun PlatformAiutaThemeToggles.toAiutaThemeToggles(): AiutaThemeToggles {
    return aiutaThemeToggles(
        isOnboardingAppBarExtended = isOnboardingAppBarExtended,
        isMainAppbarReversed = isMainAppbarReversed,
        isShadowsReduced = isShadowsReduced,
        isDelimitersExtended = isDelimitersExtended,
    )
}