package com.aiuta.flutter.fashionsdk.domain.mappers.configuration.theme.icons

import android.content.res.AssetManager
import com.aiuta.fashionsdk.compose.tokens.gradient.AiutaGradients
import com.aiuta.fashionsdk.compose.tokens.icon.AiutaDrawableIcons.AiutaDrawableIcon
import com.aiuta.fashionsdk.compose.tokens.icon.AiutaIcons
import com.aiuta.flutter.fashionsdk.domain.assets.AssetsResolver
import com.aiuta.flutter.fashionsdk.domain.mappers.configuration.theme.colors.toColor
import com.aiuta.flutter.fashionsdk.domain.models.configuration.theme.gradients.PlatformAiutaGradients
import com.aiuta.flutter.fashionsdk.domain.models.configuration.theme.icons.PlatformAiutaIcon

fun PlatformAiutaIcon.toAiutaDrawableIcon(assetManager: AssetManager): AiutaDrawableIcon {
    return AiutaDrawableIcon(
        resource = AssetsResolver.resolveDrawable(
            assetManager = assetManager,
            path = path
        ),
        shouldDrawAsIs = shouldRenderAsIs,
    )
}