package com.aiuta.flutter.fashionsdk.ui.base

import androidx.activity.ComponentActivity
import androidx.lifecycle.lifecycleScope
import com.aiuta.fashionsdk.analytic.analytic
import com.aiuta.fashionsdk.tryon.compose.domain.models.AiutaTryOnListeners
import com.aiuta.fashionsdk.tryon.core.tryon
import com.aiuta.flutter.fashionsdk.domain.aiuta.AiutaHolder
import com.aiuta.flutter.fashionsdk.domain.listeners.actions.AiutaActionsListener
import com.aiuta.flutter.fashionsdk.domain.listeners.actions.addToCartClick
import com.aiuta.flutter.fashionsdk.domain.listeners.actions.addToWishListClick
import com.aiuta.flutter.fashionsdk.domain.listeners.analytic.AiutaAnalyticListener
import com.aiuta.flutter.fashionsdk.domain.listeners.analytic.sendAnalytic
import com.aiuta.flutter.fashionsdk.domain.listeners.product.AiutaUpdateProductListener
import com.aiuta.flutter.fashionsdk.domain.mappers.product.toSKUItem
import kotlinx.coroutines.flow.filterNotNull
import kotlinx.coroutines.flow.launchIn
import kotlinx.coroutines.flow.map
import kotlinx.coroutines.flow.onEach

abstract class BaseAiutaActivity : ComponentActivity() {

    protected val aiuta by lazy { AiutaHolder.getAiuta() }
    protected val aiutaTryOn by lazy { aiuta.tryon }
    private val aiutaAnalytic by lazy { aiuta.analytic }

    protected val aiutaTryOnListeners by lazy {
        AiutaTryOnListeners(
            addToWishlistClick = { skuItem ->
                AiutaActionsListener.addToWishListClick(skuItem)
            },
            addToCartClick = { skuItem ->
                AiutaActionsListener.addToCartClick(skuItem)
                finish()
            },
            closeClick = { finish() }
        )
    }

    init {
        // Start observing
        observeActions()
        observeAnalytic()
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

    private fun observeAnalytic() {
        aiutaAnalytic.analyticFlow
            .onEach { event -> AiutaAnalyticListener.sendAnalytic(event) }
            .launchIn(lifecycleScope)
    }
}