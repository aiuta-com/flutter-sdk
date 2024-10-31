package com.aiuta.flutter.fashionsdk.domain.mappers.configuration.theme.typography

import android.content.res.AssetManager
import androidx.compose.runtime.Composable
import com.aiuta.fashionsdk.compose.tokens.typography.AiutaTypography
import com.aiuta.flutter.fashionsdk.domain.assets.AssetsResolver
import com.aiuta.flutter.fashionsdk.domain.models.configuration.theme.typography.PlatformAiutaTypography

@Composable
fun PlatformAiutaTypography.toAiutaTypography(assetManager: AssetManager): AiutaTypography {
    val fontFamily = if (fonts.isNotEmpty()) {
        AssetsResolver.resolveFontFamily(
            assetManager = assetManager,
            fonts = fonts,
        )
    } else {
        // Use default family
        null
    }

    return AiutaTypography(
        titleXL = titleXL.toTextStyle(fontFamily),
        welcomeText = welcomeText.toTextStyle(fontFamily),
        titleL = titleL.toTextStyle(fontFamily),
        titleM = titleM.toTextStyle(fontFamily),
        navbar = navbar.toTextStyle(fontFamily),
        regular = regular.toTextStyle(fontFamily),
        button = button.toTextStyle(fontFamily),
        smallButton = smallButton.toTextStyle(fontFamily),
        cells = cells.toTextStyle(fontFamily),
        chips = chips.toTextStyle(fontFamily),
        productName = productName.toTextStyle(fontFamily),
        price = price.toTextStyle(fontFamily),
        brandName = brandName.toTextStyle(fontFamily),
        description = description.toTextStyle(fontFamily),
    )
}