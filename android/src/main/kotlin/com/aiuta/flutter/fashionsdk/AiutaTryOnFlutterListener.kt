package com.aiuta.flutter.fashionsdk

import com.aiuta.fashionsdk.tryon.compose.domain.models.AiutaTryOnListeners
import io.flutter.plugin.common.EventChannel

object AiutaTryOnFlutterListener : EventChannel.StreamHandler {

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
}