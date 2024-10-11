package com.aiuta.flutter.fashionsdk.domain.mappers.configuration.theme.images

import android.content.res.AssetManager
import com.aiuta.fashionsdk.compose.tokens.images.AiutaDrawableImage
import com.aiuta.fashionsdk.compose.tokens.images.AiutaImages
import com.aiuta.flutter.fashionsdk.domain.assets.AssetsResolver
import com.aiuta.flutter.fashionsdk.domain.models.configuration.theme.images.PlatformAiutaImages

fun PlatformAiutaImages.toAiutaImages(assetManager: AssetManager): AiutaImages {
    return AiutaImages(
        preonboardingImage = preonboardingImagePath?.let {
            AiutaDrawableImage(
                resource = AssetsResolver.resolveDrawable(
                    assetManager = assetManager,
                    path = preonboardingImagePath
                ),
            )
        }
    )
}