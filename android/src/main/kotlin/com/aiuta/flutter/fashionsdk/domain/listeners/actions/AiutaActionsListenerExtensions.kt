package com.aiuta.flutter.fashionsdk.domain.listeners.actions

import com.aiuta.fashionsdk.tryon.compose.domain.models.SKUItem
import com.aiuta.flutter.fashionsdk.domain.mappers.product.toPlatformAiutaProduct
import com.aiuta.flutter.fashionsdk.domain.models.actions.PlatformAddToCartAction
import com.aiuta.flutter.fashionsdk.domain.models.actions.PlatformAddToWishListAction
import com.aiuta.flutter.fashionsdk.domain.models.actions.PlatformAiutaAction
import kotlinx.serialization.encodeToString
import kotlinx.serialization.json.Json

fun AiutaActionsListener.addToCartClick(skuItem: SKUItem) {
    val platformProduct = skuItem.toPlatformAiutaProduct()
    val action = PlatformAddToCartAction(
        product = platformProduct,
    )

    sendEvent(Json.encodeToString<PlatformAiutaAction>(action))
}

fun AiutaActionsListener.addToWishListClick(skuItem: SKUItem) {
    val platformProduct = skuItem.toPlatformAiutaProduct()
    val action = PlatformAddToWishListAction(
        product = platformProduct,
    )

    sendEvent(Json.encodeToString<PlatformAiutaAction>(action))
}