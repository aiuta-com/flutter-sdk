package com.aiuta.flutter.fashionsdk.ui.entry

import android.content.Context
import android.view.View
import androidx.compose.foundation.layout.fillMaxSize
import androidx.compose.runtime.remember
import androidx.compose.ui.Modifier
import androidx.compose.ui.platform.ComposeView
import androidx.compose.ui.platform.ViewCompositionStrategy
import androidx.lifecycle.lifecycleScope
import com.aiuta.fashionsdk.tryon.compose.domain.models.AiutaTryOnListeners
import com.aiuta.fashionsdk.tryon.compose.ui.AiutaTryOnFlow
import com.aiuta.fashionsdk.tryon.core.tryon
import com.aiuta.flutter.fashionsdk.domain.aiuta.AiutaConfigurationHolder
import com.aiuta.flutter.fashionsdk.domain.aiuta.AiutaHolder
import com.aiuta.flutter.fashionsdk.domain.listeners.actions.AiutaActionsListener
import com.aiuta.flutter.fashionsdk.domain.listeners.actions.addToCartClick
import com.aiuta.flutter.fashionsdk.domain.listeners.actions.addToWishListClick
import com.aiuta.flutter.fashionsdk.domain.listeners.product.AiutaUpdateProductListener
import com.aiuta.flutter.fashionsdk.domain.mappers.configuration.theme.rememberAiutaThemeFromPlatform
import com.aiuta.flutter.fashionsdk.domain.mappers.product.toSKUItem
import com.google.android.material.bottomsheet.BottomSheetBehavior
import com.google.android.material.bottomsheet.BottomSheetDialog
import kotlinx.coroutines.flow.filterNotNull
import kotlinx.coroutines.flow.launchIn
import kotlinx.coroutines.flow.map
import kotlinx.coroutines.flow.onEach

class AiutaBottomSheetDialog(
    private val context: Context,
    theme: Int
) : BottomSheetDialog(context, theme) {

    private val aiuta by lazy { AiutaHolder.getAiuta() }
    private val aiutaTryOn by lazy { aiuta.tryon }

    private val aiutaTryOnListeners by lazy {
        AiutaTryOnListeners(
            addToWishlistClick = { skuItem ->
                AiutaActionsListener.addToWishListClick(skuItem)
            },
            addToCartClick = { skuItem ->
                AiutaActionsListener.addToCartClick(skuItem)
                dismiss()
            },
            closeClick = { dismiss() }
        )
    }


    init {
        setContentView(composeView())
        behavior.state = BottomSheetBehavior.STATE_EXPANDED
        behavior.skipCollapsed = true

        // Start observing of actions
        observeActions()
    }

    private fun composeView(): View {
        return ComposeView(context).apply {
            setViewCompositionStrategy(ViewCompositionStrategy.DisposeOnViewTreeLifecycleDestroyed)
            setContent {
                val skuItem = remember { AiutaConfigurationHolder.getProduct().toSKUItem() }
                val theme = rememberAiutaThemeFromPlatform(
                    configuration = AiutaConfigurationHolder.getConfiguration(),
                    assetManager = context.assets
                )

                AiutaTryOnFlow(
                    modifier = Modifier.fillMaxSize(),
                    aiuta = { aiuta },
                    aiutaTryOn = { aiutaTryOn },
                    aiutaTryOnListeners = { aiutaTryOnListeners },
                    aiutaTheme = theme,
                    skuForGeneration = { skuItem }
                )
            }
        }
    }

    private fun observeActions() {
        AiutaUpdateProductListener
            .updatedActiveSKUItem
            .filterNotNull()
            .map { product -> product.toSKUItem() }
            .onEach { skuItem ->
                aiutaTryOnListeners.updateActiveSKUItem(skuItem)
            }
            .launchIn(lifecycleScope)
    }
}