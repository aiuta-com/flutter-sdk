package com.aiuta.flutter.fashionsdk.ui.main

import android.os.Bundle
import androidx.activity.compose.setContent
import androidx.activity.enableEdgeToEdge
import androidx.compose.foundation.layout.fillMaxSize
import androidx.compose.runtime.remember
import androidx.compose.ui.Modifier
import com.aiuta.fashionsdk.tryon.compose.ui.AiutaTryOnFlow
import com.aiuta.flutter.fashionsdk.domain.aiuta.AiutaConfigurationHolder
import com.aiuta.flutter.fashionsdk.domain.aiuta.AiutaTryOnConfigurationHolder
import com.aiuta.flutter.fashionsdk.domain.mappers.configuration.theme.rememberAiutaThemeFromPlatform
import com.aiuta.flutter.fashionsdk.domain.mappers.product.toSKUItem
import com.aiuta.flutter.fashionsdk.ui.base.BaseAiutaActivity

class AiutaActivity : BaseAiutaActivity() {

    override fun onCreate(savedInstanceState: Bundle?) {
        enableEdgeToEdge()
        super.onCreate(savedInstanceState)

        setContent {
            val skuItem = remember { AiutaConfigurationHolder.getProduct().toSKUItem() }
            val theme = rememberAiutaThemeFromPlatform(
                configuration = AiutaConfigurationHolder.getPlatformConfiguration(),
                assetManager = assets
            )
            val configuration = remember {
                AiutaTryOnConfigurationHolder.getTryOnConfiguration()
            }

            AiutaTryOnFlow(
                modifier = Modifier.fillMaxSize(),
                aiutaTryOnListeners = aiutaTryOnListeners,
                aiutaTryOnConfiguration = configuration,
                aiutaTheme = theme,
                skuForGeneration = skuItem,
            )
        }
    }
}