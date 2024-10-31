package com.aiuta.flutter.fashionsdk.domain.mappers.configuration.theme.typography

import android.content.res.AssetManager
import androidx.compose.runtime.Composable
import androidx.compose.ui.text.TextStyle
import androidx.compose.ui.text.font.Font
import androidx.compose.ui.text.font.FontFamily
import androidx.compose.ui.text.font.FontStyle
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.unit.sp
import com.aiuta.flutter.fashionsdk.domain.models.configuration.theme.typography.PlatformAiutaFont
import com.aiuta.flutter.fashionsdk.domain.models.configuration.theme.typography.PlatformAiutaTextStyle
import com.aiuta.flutter.fashionsdk.domain.models.configuration.theme.typography.PlatformAiutaFontWeight

@Composable
fun PlatformAiutaTextStyle.toTextStyle(
    fontFamily: FontFamily?,
): TextStyle {
    return TextStyle(
        fontFamily = fontFamily,
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

fun PlatformAiutaFont.toFont(
    resourceKey: String,
    assetManager: AssetManager,
): Font {
    return Font(
        path = resourceKey,
        assetManager = assetManager,
        weight = weight.toFontWeight(),
        style = FontStyle.Normal,
    )
}