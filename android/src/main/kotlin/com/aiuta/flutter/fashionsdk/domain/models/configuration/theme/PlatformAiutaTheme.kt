package com.aiuta.flutter.fashionsdk.domain.models.configuration.theme

import com.aiuta.flutter.fashionsdk.domain.models.configuration.theme.colors.PlatformAiutaColors
import com.aiuta.flutter.fashionsdk.domain.models.configuration.theme.dimensions.PlatformAiutaDimensions
import com.aiuta.flutter.fashionsdk.domain.models.configuration.theme.gradients.PlatformAiutaGradients
import com.aiuta.flutter.fashionsdk.domain.models.configuration.theme.icons.PlatformAiutaIcons
import com.aiuta.flutter.fashionsdk.domain.models.configuration.theme.images.PlatformAiutaImages
import com.aiuta.flutter.fashionsdk.domain.models.configuration.theme.shapes.PlatformAiutaShapes
import com.aiuta.flutter.fashionsdk.domain.models.configuration.theme.toggles.PlatformAiutaThemeToggles
import com.aiuta.flutter.fashionsdk.domain.models.configuration.theme.typography.PlatformAiutaTypography
import com.aiuta.flutter.fashionsdk.domain.models.configuration.theme.watermark.PlatformAiutaWatermark
import kotlinx.serialization.SerialName
import kotlinx.serialization.Serializable

@Serializable
class PlatformAiutaTheme(
    @SerialName("colors")
    val colors: PlatformAiutaColors? = null,

    @SerialName("gradients")
    val gradients: PlatformAiutaGradients? = null,

    @SerialName("typography")
    val typography: PlatformAiutaTypography? = null,

    @SerialName("icons")
    val icons: PlatformAiutaIcons? = null,

    @SerialName("shapes")
    val shapes: PlatformAiutaShapes? = null,

    @SerialName("dimensions")
    val dimensions: PlatformAiutaDimensions? = null,

    @SerialName("watermark")
    val watermark: PlatformAiutaWatermark? = null,

    @SerialName("images")
    val images: PlatformAiutaImages? = null,

    @SerialName("toggles")
    val toggles: PlatformAiutaThemeToggles? = null,
)