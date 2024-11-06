package com.aiuta.flutter.fashionsdk.domain.mappers.configuration.theme.images

import android.content.res.AssetManager
import com.aiuta.fashionsdk.compose.tokens.images.AiutaDrawableImage
import com.aiuta.fashionsdk.compose.tokens.images.AiutaImages
import com.aiuta.fashionsdk.compose.tokens.images.onboarding.AiutaOnboardingImages
import com.aiuta.flutter.fashionsdk.domain.assets.AssetsResolver
import com.aiuta.flutter.fashionsdk.domain.models.configuration.theme.images.PlatformAiutaImages

fun PlatformAiutaImages.toAiutaImages(
    assetManager: AssetManager,
    defaultImages: AiutaImages,
): AiutaImages {
    return AiutaImages(
        preonboardingImage = preonboardingImagePath?.toAiutaImage(
            assetManager = assetManager
        ) ?: defaultImages.preonboardingImage,
        onboardingImages = AiutaOnboardingImages(
            onboardingTryOnMainImage1 = onboardingImages?.onboardingTryOnMainImage1Path?.toAiutaImage(
                assetManager
            ) ?: defaultImages.onboardingImages.onboardingTryOnMainImage1,
            onboardingTryOnMainImage2 = onboardingImages?.onboardingTryOnMainImage2Path?.toAiutaImage(
                assetManager = assetManager
            ) ?: defaultImages.onboardingImages.onboardingTryOnMainImage2,
            onboardingTryOnMainImage3 = onboardingImages?.onboardingTryOnMainImage3Path?.toAiutaImage(
                assetManager = assetManager
            ) ?: defaultImages.onboardingImages.onboardingTryOnMainImage3,
            onboardingTryOnItemImage1 = onboardingImages?.onboardingTryOnItemImage1Path?.toAiutaImage(
                assetManager = assetManager
            ) ?: defaultImages.onboardingImages.onboardingTryOnItemImage1,
            onboardingTryOnItemImage2 = onboardingImages?.onboardingTryOnItemImage2Path?.toAiutaImage(
                assetManager = assetManager
            ) ?: defaultImages.onboardingImages.onboardingTryOnItemImage2,
            onboardingTryOnItemImage3 = onboardingImages?.onboardingTryOnItemImage3Path?.toAiutaImage(
                assetManager = assetManager
            ) ?: defaultImages.onboardingImages.onboardingTryOnItemImage3,
            onboardingBestResulBadImage1 = onboardingImages?.onboardingBestResulBadImage1Path?.toAiutaImage(
                assetManager = assetManager
            ) ?: defaultImages.onboardingImages.onboardingBestResulBadImage1,
            onboardingBestResulBadImage2 = onboardingImages?.onboardingBestResulBadImage2Path?.toAiutaImage(
                assetManager = assetManager
            ) ?: defaultImages.onboardingImages.onboardingBestResulBadImage2,
            onboardingBestResulGoodImage1 = onboardingImages?.onboardingBestResulGoodImage1Path?.toAiutaImage(
                assetManager = assetManager
            ) ?: defaultImages.onboardingImages.onboardingBestResulGoodImage1,
            onboardingBestResulGoodImage2 = onboardingImages?.onboardingBestResulGoodImage2Path?.toAiutaImage(
                assetManager = assetManager
            ) ?: defaultImages.onboardingImages.onboardingBestResulGoodImage2,
        ),
        selectorEmptyImage = selectorEmptyImagePath?.toAiutaImage(
            assetManager = assetManager
        ) ?: defaultImages.selectorEmptyImage,
        feedbackThanksImage = feedbackThanksImagePath?.toAiutaImage(
            assetManager = assetManager
        ) ?: defaultImages.feedbackThanksImage,
    )
}

private fun String.toAiutaImage(assetManager: AssetManager): AiutaDrawableImage {
    return AiutaDrawableImage(
        resource = AssetsResolver.resolveDrawable(
            assetManager = assetManager,
            path = this
        ),
    )
}