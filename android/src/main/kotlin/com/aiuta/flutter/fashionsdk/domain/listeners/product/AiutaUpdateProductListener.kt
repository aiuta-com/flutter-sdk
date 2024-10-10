package com.aiuta.flutter.fashionsdk.domain.listeners.product

import com.aiuta.flutter.fashionsdk.domain.models.product.PlatformAiutaProduct
import com.aiuta.flutter.fashionsdk.utils.json
import kotlinx.coroutines.flow.MutableStateFlow
import kotlinx.coroutines.flow.StateFlow

object AiutaUpdateProductListener {

    private val _updatedActiveSKUItem: MutableStateFlow<PlatformAiutaProduct?> = MutableStateFlow(null)
    val updatedActiveSKUItem: StateFlow<PlatformAiutaProduct?> = _updatedActiveSKUItem

    fun updateActiveSKUItem(rawProduct: String) {
        _updatedActiveSKUItem.value = json.decodeFromString(rawProduct)
    }
}