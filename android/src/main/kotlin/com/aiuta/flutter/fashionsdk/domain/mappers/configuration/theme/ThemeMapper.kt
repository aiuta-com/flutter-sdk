package com.aiuta.flutter.fashionsdk.domain.mappers.configuration.theme

import android.content.res.AssetManager
import android.util.Log
import androidx.compose.runtime.Composable
import androidx.compose.runtime.remember
import com.aiuta.fashionsdk.compose.icons.rememberDefaultAiutaIcons
import com.aiuta.fashionsdk.compose.tokens.AiutaTheme
import com.aiuta.fashionsdk.compose.tokens.color.DefaultAiutaColors
import com.aiuta.fashionsdk.compose.tokens.gradient.DefaultAiutaGradients
import com.aiuta.fashionsdk.compose.tokens.rememberAiutaTheme
import com.aiuta.fashionsdk.compose.tokens.shape.DefaultAiutaShapes
import com.aiuta.fashionsdk.compose.tokens.typography.DefaultAiutaTypography
import com.aiuta.flutter.fashionsdk.domain.mappers.configuration.theme.colors.toAiutaColors
import com.aiuta.flutter.fashionsdk.domain.mappers.configuration.theme.gradients.toAiutaGradients
import com.aiuta.flutter.fashionsdk.domain.mappers.configuration.theme.icons.toAiutaIcons
import com.aiuta.flutter.fashionsdk.domain.mappers.configuration.theme.shapes.toAiutaShapes
import com.aiuta.flutter.fashionsdk.domain.mappers.configuration.theme.typography.toAiutaTypography
import com.aiuta.flutter.fashionsdk.domain.models.configuration.PlatformAiutaConfiguration

@Composable
fun rememberAiutaThemeFromPlatform(
    configuration: PlatformAiutaConfiguration,
    assetManager: AssetManager,
): AiutaTheme {
    val theme = configuration.toAiutaTheme(assetManager)

    return remember(
        configuration,
        assetManager
    ) { theme }
}

@Composable
fun PlatformAiutaConfiguration.toAiutaTheme(assetManager: AssetManager): AiutaTheme {
    val platformTheme = this.theme

    // Check is theme applied
    if (platformTheme == null) {
        return rememberAiutaTheme(icons = rememberDefaultAiutaIcons())
    }

    val defaultIcons = rememberDefaultAiutaIcons()
    val proceedTypography = platformTheme.typography?.toAiutaTypography(assetManager)

    return AiutaTheme(
        colors = platformTheme.colors?.toAiutaColors() ?: DefaultAiutaColors,
        gradients = platformTheme.gradients?.toAiutaGradients() ?: DefaultAiutaGradients,
        typography = proceedTypography ?: DefaultAiutaTypography,
        icons = platformTheme.icons?.toAiutaIcons(assetManager) ?: defaultIcons,
        shapes = platformTheme.shapes?.toAiutaShapes() ?: DefaultAiutaShapes,
        watermarkRes = null, // TODO Add watermark
        // TODO Add images
    )
}