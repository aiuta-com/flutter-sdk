package com.aiuta.flutter.fashionsdk.ui.entry

import android.os.Bundle
import androidx.activity.ComponentActivity
import androidx.activity.compose.setContent
import androidx.compose.foundation.layout.fillMaxSize
import androidx.compose.runtime.remember
import androidx.compose.ui.Modifier
import com.aiuta.fashionsdk.compose.icons.rememberDefaultAiutaIcons
import com.aiuta.fashionsdk.compose.tokens.rememberAiutaTheme
import com.aiuta.fashionsdk.tryon.compose.domain.models.AiutaTryOnListeners
import com.aiuta.fashionsdk.tryon.compose.ui.AiutaTryOnFlow
import com.aiuta.fashionsdk.tryon.core.tryon
import com.aiuta.flutter.fashionsdk.domain.aiuta.AiutaConfigurationHolder
import com.aiuta.flutter.fashionsdk.domain.aiuta.AiutaHolder
import com.aiuta.flutter.fashionsdk.domain.listeners.AiutaTryOnFlutterListener
import com.aiuta.flutter.fashionsdk.domain.mappers.configuration.theme.rememberAiutaThemeFromPlatform
import com.aiuta.flutter.fashionsdk.domain.mappers.configuration.theme.toAiutaTheme
import com.aiuta.flutter.fashionsdk.domain.mappers.product.toSKUItem
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.embedding.engine.dart.DartExecutor
import io.flutter.plugin.common.EventChannel

class AiutaActivity : ComponentActivity() {

    private val aiuta by lazy { AiutaHolder.getAiuta() }
    private val aiutaTryOn by lazy { aiuta.tryon }

    private val aiutaTryOnListeners by lazy {
        AiutaTryOnListeners(
            addToWishlistActiveItemClick = { skuItem ->
                // TODO
                AiutaTryOnFlutterListener.sendEvent("addToWishlistClick")
                skuItem
            },
            addToWishlistGenerateMoreItemClick = { skuItem ->
                // TODO
                AiutaTryOnFlutterListener.sendEvent("addToWishlistClick")
                skuItem
            },
            addToCartClick = {
                AiutaTryOnFlutterListener.sendEvent("addToCartClick")
                finish()
            },
            closeClick = {
                AiutaTryOnFlutterListener.sendEvent("closeClick")
                finish()
            }
        )
    }

    private lateinit var flutterEngine: FlutterEngine

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)

        // TODO Move to plugin?
        // Initialize Flutter engine
        flutterEngine = FlutterEngine(this)

        flutterEngine.dartExecutor.executeDartEntrypoint(
            DartExecutor.DartEntrypoint.createDefault()
        )

        EventChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL).setStreamHandler(
            AiutaTryOnFlutterListener
        )

        setContent {
            val skuItem = remember { AiutaConfigurationHolder.getProduct().toSKUItem() }
            val theme = rememberAiutaThemeFromPlatform(
                configuration = AiutaConfigurationHolder.getConfiguration(),
                assetManager = assets
            )


            AiutaTryOnFlow(
                modifier = Modifier.fillMaxSize(),
                aiuta = { aiuta },
                aiutaTryOn = { aiutaTryOn },
                aiutaTryOnListeners = { aiutaTryOnListeners },
                aiutaTheme = theme,
                skuForGeneration = { skuItem },
            )
        }

    }


    companion object {
        private val CHANNEL = "aiutaActionsHandler"
    }
}