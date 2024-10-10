package com.aiuta.flutter.fashionsdk.domain.listeners.actions

import io.flutter.plugin.common.EventChannel

object AiutaActionsListener : EventChannel.StreamHandler {

    private var eventSink: EventChannel.EventSink? = null

    override fun onListen(arguments: Any?, events: EventChannel.EventSink?) {
        eventSink = events
    }

    override fun onCancel(arguments: Any?) {
        eventSink = null
    }

    fun sendEvent(data: String) {
        eventSink?.success(data)
    }

    // Channel key
    const val KEY_CHANNEL = "aiutaActionsHandler"

    // All possible actions
    const val ADD_TO_WISHLIST_CLICK = "addToWishlistClick"
    const val ADD_TO_CART_CLICK = "addToCartClick"
}