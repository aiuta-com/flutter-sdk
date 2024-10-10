package com.aiuta.flutter.fashionsdk.domain.listeners.auth

import io.flutter.plugin.common.EventChannel

object AiutaJWTAuthenticationListener : EventChannel.StreamHandler {

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
    const val KEY_CHANNEL = "aiutaJWTAuthHandler"

    // All possible actions
    const val ACTION_REQUEST_JWT = "requestJWT"
}