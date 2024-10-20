package com.aiuta.flutter.fashionsdk.ui.main

import android.os.Bundle
import androidx.activity.ComponentActivity
import androidx.activity.compose.setContent
import androidx.activity.enableEdgeToEdge
import androidx.compose.foundation.layout.fillMaxSize
import androidx.compose.runtime.remember
import androidx.compose.ui.Modifier
import androidx.lifecycle.lifecycleScope
import com.aiuta.fashionsdk.analytic.analytic
import com.aiuta.fashionsdk.tryon.compose.domain.models.AiutaTryOnListeners
import com.aiuta.fashionsdk.tryon.compose.ui.AiutaTryOnFlow
import com.aiuta.fashionsdk.tryon.core.tryon
import com.aiuta.flutter.fashionsdk.domain.aiuta.AiutaConfigurationHolder
import com.aiuta.flutter.fashionsdk.domain.aiuta.AiutaHolder
import com.aiuta.flutter.fashionsdk.domain.listeners.actions.AiutaActionsListener
import com.aiuta.flutter.fashionsdk.domain.listeners.actions.addToCartClick
import com.aiuta.flutter.fashionsdk.domain.listeners.actions.addToWishListClick
import com.aiuta.flutter.fashionsdk.domain.listeners.analytic.AiutaAnalyticListener
import com.aiuta.flutter.fashionsdk.domain.listeners.analytic.sendAnalytic
import com.aiuta.flutter.fashionsdk.domain.listeners.product.AiutaUpdateProductListener
import com.aiuta.flutter.fashionsdk.domain.mappers.configuration.rememberAiutaTryOnConfigurationFromPlatform
import com.aiuta.flutter.fashionsdk.domain.mappers.configuration.theme.rememberAiutaThemeFromPlatform
import com.aiuta.flutter.fashionsdk.domain.mappers.product.toSKUItem
import com.aiuta.flutter.fashionsdk.ui.base.BaseAiutaActivity
import kotlinx.coroutines.flow.filterNotNull
import kotlinx.coroutines.flow.launchIn
import kotlinx.coroutines.flow.map
import kotlinx.coroutines.flow.onEach

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