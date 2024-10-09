package com.aiuta.flutter.fashionsdk.domain.models.configuration.theme.typography

import kotlinx.serialization.SerialName
import kotlinx.serialization.Serializable

@Serializable
class PlatformAiutaTypography(
    @SerialName("titleXL")
    val titleXL: PlatformAiutaFont,

    @SerialName("welcomeText")
    val welcomeText: PlatformAiutaFont,

    @SerialName("titleL")
    val titleL: PlatformAiutaFont,

    @SerialName("titleM")
    val titleM: PlatformAiutaFont,

    @SerialName("navbar")
    val navbar: PlatformAiutaFont,

    @SerialName("regular")
    val regular: PlatformAiutaFont,

    @SerialName("button")
    val button: PlatformAiutaFont,

    @SerialName("smallButton")
    val smallButton: PlatformAiutaFont,

    @SerialName("cells")
    val cells: PlatformAiutaFont,

    @SerialName("chips")
    val chips: PlatformAiutaFont,

    @SerialName("productName")
    val productName: PlatformAiutaFont,

    @SerialName("price")
    val price: PlatformAiutaFont,

    @SerialName("brandName")
    val brandName: PlatformAiutaFont,

    @SerialName("description")
    val description: PlatformAiutaFont
)