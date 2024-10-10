package com.aiuta.flutter.fashionsdk.ui.entry

import android.content.Context
import android.view.View
import androidx.compose.foundation.layout.fillMaxSize
import androidx.compose.runtime.remember
import androidx.compose.ui.Modifier
import androidx.compose.ui.platform.ComposeView
import androidx.compose.ui.platform.ViewCompositionStrategy
import com.aiuta.fashionsdk.compose.icons.rememberDefaultAiutaIcons
import com.aiuta.fashionsdk.compose.tokens.rememberAiutaTheme
import com.aiuta.fashionsdk.tryon.compose.domain.models.AiutaTryOnListeners
import com.aiuta.fashionsdk.tryon.compose.domain.models.SKUItem
import com.aiuta.fashionsdk.tryon.compose.ui.AiutaTryOnFlow
import com.aiuta.fashionsdk.tryon.core.tryon
import com.aiuta.flutter.fashionsdk.AiutaApplication
import com.aiuta.flutter.fashionsdk.domain.aiuta.AiutaHolder
import com.aiuta.flutter.fashionsdk.domain.listeners.AiutaTryOnFlutterListener
import com.google.android.material.bottomsheet.BottomSheetBehavior
import com.google.android.material.bottomsheet.BottomSheetDialog

class AiutaBottomSheetDialog(
    private val context: Context,
    theme: Int
) : BottomSheetDialog(context, theme) {

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
                dismiss()
            },
            closeClick = {
                AiutaTryOnFlutterListener.sendEvent("closeClick")
                dismiss()
            }
        )
    }


    init {
        setContentView(composeView())
        behavior.state = BottomSheetBehavior.STATE_EXPANDED
        behavior.skipCollapsed = true
    }

    private fun composeView(): View {
        return ComposeView(context).apply {
            setViewCompositionStrategy(ViewCompositionStrategy.DisposeOnViewTreeLifecycleDestroyed)
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
                            inWishlist = false,
                        )
                    }

                val mockAiutaTheme =
                    rememberAiutaTheme(
                        icons = rememberDefaultAiutaIcons(),
                    )

                AiutaTryOnFlow(
                    modifier = Modifier.fillMaxSize(),
                    aiuta = { aiuta },
                    aiutaTryOn = { aiutaTryOn },
                    aiutaTryOnListeners = { aiutaTryOnListeners },
                    aiutaTheme = mockAiutaTheme,
                    skuForGeneration = {
                        mockSKUItem
                    }
                )
            }
        }
    }
}