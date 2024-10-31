package com.aiuta.flutter.fashionsdk.domain.models.configuration.theme.typography

import kotlinx.serialization.SerialName
import kotlinx.serialization.Serializable

@Serializable
class PlatformAiutaTypography(
    @SerialName("familyFonts")
    val familyFonts: List<PlatformAiutaFont>,

    @SerialName("titleXL")
    val titleXL: PlatformAiutaTextStyle,

    @SerialName("welcomeText")
    val welcomeText: PlatformAiutaTextStyle,

    @SerialName("titleL")
    val titleL: PlatformAiutaTextStyle,

    @SerialName("titleM")
    val titleM: PlatformAiutaTextStyle,

    @SerialName("navbar")
    val navbar: PlatformAiutaTextStyle,

    @SerialName("regular")
    val regular: PlatformAiutaTextStyle,

    @SerialName("button")
    val button: PlatformAiutaTextStyle,

    @SerialName("smallButton")
    val smallButton: PlatformAiutaTextStyle,

    @SerialName("cells")
    val cells: PlatformAiutaTextStyle,

    @SerialName("chips")
    val chips: PlatformAiutaTextStyle,

    @SerialName("productName")
    val productName: PlatformAiutaTextStyle,

    @SerialName("price")
    val price: PlatformAiutaTextStyle,

    @SerialName("brandName")
    val brandName: PlatformAiutaTextStyle,

    @SerialName("description")
    val description: PlatformAiutaTextStyle
)