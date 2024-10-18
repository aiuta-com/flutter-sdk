package com.aiuta.flutter.fashionsdk.domain.models.configuration

import com.aiuta.flutter.fashionsdk.domain.models.configuration.auth.PlatformAiutaAuthentication
import com.aiuta.flutter.fashionsdk.domain.models.configuration.dataprovider.PlatformAiutaDataProvider
import com.aiuta.flutter.fashionsdk.domain.models.configuration.language.PlatformAiutaLanguage
import com.aiuta.flutter.fashionsdk.domain.models.configuration.mode.PlatformAiutaMode
import com.aiuta.flutter.fashionsdk.domain.models.configuration.theme.PlatformAiutaTheme
import com.aiuta.flutter.fashionsdk.domain.models.configuration.toggles.PlatformAiutaToggles
import kotlinx.serialization.SerialName
import kotlinx.serialization.Serializable

@Serializable
data class PlatformAiutaConfiguration(
    // Mode
    @SerialName("mode")
    val mode: PlatformAiutaMode,

    // Authentication
    @SerialName("authentication")
    val authentication: PlatformAiutaAuthentication,

    // Toggles
    @SerialName("toggles")
    val toggles: PlatformAiutaToggles,

    // Language
    @SerialName("language")
    val language: PlatformAiutaLanguage,

    // Theme
    @SerialName("dataProvider")
    val dataProvider: PlatformAiutaDataProvider? = null,

    // Theme
    @SerialName("theme")
    val theme: PlatformAiutaTheme? = null
)