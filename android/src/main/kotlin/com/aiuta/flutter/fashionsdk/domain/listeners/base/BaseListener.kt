package com.aiuta.flutter.fashionsdk.domain.listeners.base

import io.flutter.plugin.common.EventChannel

abstract class BaseListener : EventChannel.StreamHandler {

    abstract val keyChannel: String

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