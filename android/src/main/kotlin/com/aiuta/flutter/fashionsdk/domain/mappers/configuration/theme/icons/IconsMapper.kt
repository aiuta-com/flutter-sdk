package com.aiuta.flutter.fashionsdk.domain.mappers.configuration.theme.icons

import android.content.res.AssetManager
import com.aiuta.fashionsdk.compose.tokens.icon.AiutaDrawableIcons
import com.aiuta.fashionsdk.compose.tokens.icon.AiutaIcons
import com.aiuta.flutter.fashionsdk.domain.models.configuration.theme.icons.PlatformAiutaIcons

fun PlatformAiutaIcons.toAiutaIcons(assetManager: AssetManager): AiutaIcons {
    return AiutaDrawableIcons(
        recent100 = null,
        welcomeScreen82 = preonboarding82.toAiutaDrawableIcon(assetManager),
        error36 = error36.toAiutaDrawableIcon(assetManager),
        like36 = like36.toAiutaDrawableIcon(assetManager),
        dislike36 = dislike36.toAiutaDrawableIcon(assetManager),
        imageError36 = imageError36.toAiutaDrawableIcon(assetManager),
        back24 = back24.toAiutaDrawableIcon(assetManager),
        camera24 = camera24.toAiutaDrawableIcon(assetManager),
        checkCorrect24 = checkCorrect24.toAiutaDrawableIcon(assetManager),
        checkNotCorrect24 = checkNotCorrect24.toAiutaDrawableIcon(assetManager),
        close24 = close24.toAiutaDrawableIcon(assetManager),
        trash24 = trash24.toAiutaDrawableIcon(assetManager),
        takePhoto24 = takePhoto24.toAiutaDrawableIcon(assetManager),
        history24 = history24.toAiutaDrawableIcon(assetManager),
        photoLibrary24 = photoLibrary24.toAiutaDrawableIcon(assetManager),
        share24 = share24.toAiutaDrawableIcon(assetManager),
        wishlist24 = wishlist24.toAiutaDrawableIcon(assetManager),
        wishlistFill24 = wishlistFill24.toAiutaDrawableIcon(assetManager),
        info20 = info20.toAiutaDrawableIcon(assetManager),
        check20 = check20.toAiutaDrawableIcon(assetManager),
        magic20 = magic20.toAiutaDrawableIcon(assetManager),
        lock16 = lock16.toAiutaDrawableIcon(assetManager),
        arrow16 = arrow16.toAiutaDrawableIcon(assetManager),
        loading14 = loading14.toAiutaDrawableIcon(assetManager),
    )
}