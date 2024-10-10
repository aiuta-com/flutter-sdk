package com.aiuta.flutter.fashionsdk.domain.mappers.configuration.theme.typography

import android.content.res.AssetManager
import androidx.compose.runtime.Composable
import com.aiuta.fashionsdk.compose.tokens.typography.AiutaTypography
import com.aiuta.flutter.fashionsdk.domain.models.configuration.theme.typography.PlatformAiutaTypography

@Composable
fun PlatformAiutaTypography.toAiutaTypography(assetManager: AssetManager): AiutaTypography {
    return AiutaTypography(
        titleXL = titleXL.toTextStyle(assetManager),
        welcomeText = titleXL.toTextStyle(assetManager),
        titleL = titleL.toTextStyle(assetManager),
        titleM = titleM.toTextStyle(assetManager),
        navbar = navbar.toTextStyle(assetManager),
        regular = regular.toTextStyle(assetManager),
        button = button.toTextStyle(assetManager),
        smallButton = smallButton.toTextStyle(assetManager),
        cells = cells.toTextStyle(assetManager),
        chips = chips.toTextStyle(assetManager),
        productName = productName.toTextStyle(assetManager),
        price = price.toTextStyle(assetManager),
        brandName = brandName.toTextStyle(assetManager),
        description = description.toTextStyle(assetManager),
    )
}