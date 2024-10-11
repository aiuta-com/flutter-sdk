package com.aiuta.flutter.fashionsdk.domain.mappers.configuration

import androidx.compose.runtime.Composable
import androidx.compose.runtime.remember
import com.aiuta.fashionsdk.tryon.compose.domain.models.AiutaTryOnConfiguration
import com.aiuta.fashionsdk.tryon.compose.domain.models.defaultAiutaTryOnConfiguration
import com.aiuta.flutter.fashionsdk.domain.mappers.configuration.dimensions.toAiutaDimensions
import com.aiuta.flutter.fashionsdk.domain.mappers.configuration.language.toAiutaLanguage
import com.aiuta.flutter.fashionsdk.domain.models.configuration.PlatformAiutaConfiguration

@Composable
fun rememberAiutaTryOnConfigurationFromPlatform(configuration: PlatformAiutaConfiguration): AiutaTryOnConfiguration {
    val nativeConfiguration = configuration.toAiutaConfiguration()
    return remember(configuration) {
        nativeConfiguration
    }
}

fun PlatformAiutaConfiguration.toAiutaConfiguration(): AiutaTryOnConfiguration {
    return defaultAiutaTryOnConfiguration(
        language = language.toAiutaLanguage(),
        dimensions = dimensions?.toAiutaDimensions(),
        isHistoryAvailable = toggles.isHistoryAvailable,
        isWishlistAvailable = toggles.isWishlistAvailable,
        isPreOnboardingAvailable = toggles.isPreOnboardingAvailable,
        isOnboardingAppBarExtended = theme?.toggles?.isOnboardingAppBarExtended ?: false,
        isMainAppbarReversed = theme?.toggles?.isMainAppbarReversed ?: false,
    )
}