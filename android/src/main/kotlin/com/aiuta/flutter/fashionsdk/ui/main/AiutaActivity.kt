package com.aiuta.flutter.fashionsdk.ui.main

import android.os.Bundle
import androidx.activity.compose.setContent
import androidx.activity.enableEdgeToEdge
import androidx.compose.foundation.layout.fillMaxSize
import androidx.compose.runtime.remember
import androidx.compose.ui.Modifier
import com.aiuta.fashionsdk.tryon.compose.ui.AiutaTryOnFlow
import com.aiuta.flutter.fashionsdk.domain.aiuta.AiutaConfigurationHolder
import com.aiuta.flutter.fashionsdk.domain.mappers.configuration.rememberAiutaTryOnConfigurationFromPlatform
import com.aiuta.flutter.fashionsdk.domain.mappers.configuration.theme.rememberAiutaThemeFromPlatform
import com.aiuta.flutter.fashionsdk.domain.mappers.product.toSKUItem
import com.aiuta.flutter.fashionsdk.ui.base.BaseAiutaActivity

class AiutaActivity : BaseAiutaActivity() {

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)

        enableEdgeToEdge()

        setContent {
            val skuItem = remember { AiutaConfigurationHolder.getProduct().toSKUItem() }
            val theme = rememberAiutaThemeFromPlatform(
                configuration = AiutaConfigurationHolder.getConfiguration(),
                assetManager = assets
            )
            val configuration = rememberAiutaTryOnConfigurationFromPlatform(
                configuration = AiutaConfigurationHolder.getConfiguration(),
            )

            AiutaTryOnFlow(
                modifier = Modifier.fillMaxSize(),
                aiuta = { aiuta },
                aiutaTryOn = { aiutaTryOn },
                aiutaTryOnListeners = { aiutaTryOnListeners },
                aiutaTryOnConfiguration = { configuration },
                aiutaTheme = theme,
                skuForGeneration = { skuItem },
            )
        }
    }
}