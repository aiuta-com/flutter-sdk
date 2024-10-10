package com.aiuta.flutter.fashionsdk.domain.mappers.configuration.theme.typography

import android.content.res.AssetManager
import androidx.compose.runtime.Composable
import androidx.compose.ui.text.TextStyle
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.unit.sp
import com.aiuta.flutter.fashionsdk.domain.assets.AssetsResolver
import com.aiuta.flutter.fashionsdk.domain.models.configuration.theme.typography.PlatformAiutaFont
import com.aiuta.flutter.fashionsdk.domain.models.configuration.theme.typography.PlatformAiutaFontWeight

@Composable
fun PlatformAiutaFont.toTextStyle(assetManager: AssetManager): TextStyle {
    return TextStyle(
        fontFamily = AssetsResolver.resolveFontFamily(
            assetManager = assetManager,
            path = ttfPath,
        ),
        fontSize = fontSize.sp,
        fontWeight = fontWeight.toFontWeight(),
        letterSpacing = letterSpacing.sp,
        lineHeight = lineHeight.sp,
    )
}

fun PlatformAiutaFontWeight.toFontWeight(): FontWeight {
    return when(this) {
        PlatformAiutaFontWeight.THIN -> FontWeight.Thin
        PlatformAiutaFontWeight.EXTRALIGHT -> FontWeight.ExtraLight
        PlatformAiutaFontWeight.LIGHT -> FontWeight.Light
        PlatformAiutaFontWeight.NORMAL -> FontWeight.Normal
        PlatformAiutaFontWeight.MEDIUM -> FontWeight.Medium
        PlatformAiutaFontWeight.SEMIBOLD -> FontWeight.SemiBold
        PlatformAiutaFontWeight.BOLD -> FontWeight.Bold
        PlatformAiutaFontWeight.EXTRABOLD -> FontWeight.ExtraBold
        PlatformAiutaFontWeight.BLACK -> FontWeight.Black
    }
}