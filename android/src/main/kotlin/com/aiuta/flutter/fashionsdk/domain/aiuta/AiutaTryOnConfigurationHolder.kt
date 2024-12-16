package com.aiuta.flutter.fashionsdk.domain.aiuta

import com.aiuta.fashionsdk.tryon.compose.domain.models.configuration.AiutaTryOnConfiguration
import com.aiuta.flutter.fashionsdk.domain.mappers.configuration.dataprovider.toAiutaDataProvider
import com.aiuta.flutter.fashionsdk.domain.mappers.configuration.dimensions.toAiutaDimensions
import com.aiuta.flutter.fashionsdk.domain.mappers.configuration.language.toAiutaLanguage
import com.aiuta.flutter.fashionsdk.domain.mappers.configuration.meta.toHostMetadata
import com.aiuta.flutter.fashionsdk.domain.mappers.configuration.toggles.toAiutaToggles


object AiutaTryOnConfigurationHolder {
    private var aiutaTryOnConfiguration: AiutaTryOnConfiguration? = null

    // Configuration
    fun setTryOnConfiguration() {
        val configuration = AiutaConfigurationHolder.getPlatformConfiguration()

        aiutaTryOnConfiguration = AiutaTryOnConfiguration.Builder()
            .setAiuta(AiutaHolder.getAiuta())
            .setToggles(configuration.toggles.toAiutaToggles())
            .setLanguage(configuration.language.toAiutaLanguage())
            .setHostMetadata(configuration.toHostMetadata())
            .apply {
                configuration.theme?.dimensions?.let { dimensions ->
                    setDimensions(dimensions.toAiutaDimensions())
                }
            }
            .apply {
                configuration.dataProvider?.let { dataProvider ->
                    setDataProvider(dataProvider.toAiutaDataProvider())
                }
            }
            .build()
    }

    fun getTryOnConfiguration(): AiutaTryOnConfiguration {
        return checkNotNull(aiutaTryOnConfiguration) {
            "AiutaTryOnConfigurationHolder: configuration is not init. Please call setTryOnConfiguration()"
        }
    }
}