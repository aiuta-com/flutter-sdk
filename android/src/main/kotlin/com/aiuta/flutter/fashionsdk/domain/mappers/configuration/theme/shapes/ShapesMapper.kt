package com.aiuta.flutter.fashionsdk.domain.mappers.configuration.theme.shapes

import androidx.compose.ui.unit.dp
import com.aiuta.fashionsdk.compose.tokens.shape.AiutaShapes
import com.aiuta.fashionsdk.compose.tokens.shape.aiutaShapes
import com.aiuta.flutter.fashionsdk.domain.models.configuration.theme.shapes.PlatformAiutaShapes

fun PlatformAiutaShapes.toAiutaShapes(): AiutaShapes {
    return aiutaShapes(
        mainImageRadiusDp = mainImage.dp,
        previewImageRadiusDp = previewImage.dp,
        onboardingImageRadiusDp = onboardingImage.dp,
        bottomSheetRadiusDp = bottomSheet.dp,
        buttonLRadiusDp = buttonL.dp,
        buttonMRadiusDp = buttonM.dp,
    )
}