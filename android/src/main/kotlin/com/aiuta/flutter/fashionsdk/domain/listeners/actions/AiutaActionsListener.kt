package com.aiuta.flutter.fashionsdk.domain.listeners.actions

import com.aiuta.flutter.fashionsdk.domain.listeners.base.BaseListener


object AiutaActionsListener : BaseListener() {

    // Channel key
    override val keyChannel: String = "aiutaActionsHandler"

    // All possible actions
    const val ACTION_ADD_TO_WISHLIST_CLICK = "addToWishlistClick"
    const val ACTION_ADD_TO_CART_CLICK = "addToCartClick"
}