package com.aiuta.flutter.fashionsdk.domain.listeners.base

import io.flutter.plugin.common.EventChannel
import kotlinx.coroutines.CoroutineScope
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.SupervisorJob
import kotlinx.coroutines.launch

abstract class BaseListener : EventChannel.StreamHandler {

    abstract val keyChannel: String

    private var eventSink: EventChannel.EventSink? = null
    private val mainScope = CoroutineScope(Dispatchers.Main.immediate + SupervisorJob())

    override fun onListen(arguments: Any?, events: EventChannel.EventSink?) {
        eventSink = events
    }

    override fun onCancel(arguments: Any?) {
        eventSink = null
    }

    fun sendEvent(data: String) {
        mainScope.launch { eventSink?.success(data) }
    }
}