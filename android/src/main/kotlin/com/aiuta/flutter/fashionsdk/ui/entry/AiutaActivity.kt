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
import com.aiuta.fashionsdk.tryon.compose.domain.models.SKUItem
import com.aiuta.fashionsdk.tryon.compose.ui.AiutaTryOnFlow
import com.aiuta.fashionsdk.tryon.core.tryon
import com.aiuta.flutter.fashionsdk.AiutaApplication
import com.aiuta.flutter.fashionsdk.domain.listeners.AiutaTryOnFlutterListener
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.embedding.engine.dart.DartExecutor
import io.flutter.plugin.common.EventChannel

class AiutaActivity : ComponentActivity() {
    private val aiutaTryOn = AiutaApplication.aiuta.tryon

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

        // Initialize Flutter engine
        flutterEngine = FlutterEngine(this)

        flutterEngine.dartExecutor.executeDartEntrypoint(
            DartExecutor.DartEntrypoint.createDefault()
        )

        EventChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL).setStreamHandler(
            AiutaTryOnFlutterListener
        )

        setContent {
            val mockSKUItem =
                remember {
                    SKUItem(
                        skuId = "HBCV00006IWQPU",
                        catalogName = "main",
                        description = "MOCK 90s straight leg jeans in light blue",
                        imageUrls = emptyList(),
                        localizedPrice = "$34.99",
                        localizedOldPrice = "$41.99",
                        store = "MOCK STORE",
                        additionalShareInfo =
                        """
                        You can find more information about this item here:
                        https://some-cool-website.com/product
                        """.trimIndent(),
                        inWishlist = false
                    )
                }

            val mockAiutaTheme =
                rememberAiutaTheme(
                    icons = rememberDefaultAiutaIcons(),
                )

            AiutaTryOnFlow(
                modifier = Modifier.fillMaxSize(),
                aiuta = { AiutaApplication.aiuta },
                aiutaTryOn = { aiutaTryOn },
                aiutaTryOnListeners = { aiutaTryOnListeners },
                aiutaTheme = mockAiutaTheme,
                skuForGeneration = { mockSKUItem },
            )
        }

    }


    companion object {
        private val CHANNEL = "aiutaActionsHandler"
    }
}