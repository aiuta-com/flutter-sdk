package com.aiuta.flutter.fashionsdk.domain.aiuta

import com.aiuta.flutter.fashionsdk.domain.models.configuration.PlatformAiutaConfiguration
import com.aiuta.flutter.fashionsdk.domain.models.product.PlatformAiutaProduct
import com.aiuta.flutter.fashionsdk.utils.json

fun initAiutaConfigurationHolder(block: AiutaConfigurationHolder.() -> Unit) {
    AiutaConfigurationHolder.block()
}

object AiutaConfigurationHolder {
    // Keys for arguments
    const val PRODUCT_KEY = "product"
    const val CONFIGURATION_KEY = "configuration"

    private var product: PlatformAiutaProduct? = null
    private var configuration: PlatformAiutaConfiguration? = null

    // Product
    fun setProduct(rawInput: String?) {
        product = setItem(rawInput)
    }

    fun getProduct(): PlatformAiutaProduct {
        return checkNotNull(product) {
            "AiutaConfigurationHolder: product is not init. Please call setProduct()"
        }
    }

    // Configuration
    fun setConfiguration(rawInput: String?) {
        configuration = setItem(rawInput)
    }

    fun getConfiguration(): PlatformAiutaConfiguration {
        return checkNotNull(configuration) {
            "AiutaConfigurationHolder: configuration is not init. Please call setConfiguration()"
        }
    }

    private inline fun <reified T> setItem(rawInput: String?): T? {
        return rawInput?.let { json.decodeFromString<T>(rawInput) }
    }
}