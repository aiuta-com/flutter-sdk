package com.aiuta.flutter.fashionsdk.domain.mappers.configuration.theme.watermark

import android.content.res.AssetManager
import com.aiuta.fashionsdk.compose.tokens.images.AiutaDrawableImage
import com.aiuta.fashionsdk.compose.tokens.images.AiutaImage
import com.aiuta.flutter.fashionsdk.domain.assets.AssetsResolver
import com.aiuta.flutter.fashionsdk.domain.models.configuration.theme.watermark.PlatformAiutaWatermark

fun PlatformAiutaWatermark.toAiutaImage(assetManager: AssetManager): AiutaImage {
    return AiutaDrawableImage(
        resource = AssetsResolver.resolveDrawable(
            assetManager = assetManager,
            path = path
        )
    )
}