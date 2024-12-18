package com.aiuta.flutter.fashionsdk.domain.listeners.state

import kotlinx.coroutines.flow.MutableStateFlow
import kotlinx.coroutines.flow.StateFlow

object AiutaSDKStateListener {
    private val _isSDKInForeground: MutableStateFlow<Boolean> = MutableStateFlow(false)
    val isSDKInForeground: StateFlow<Boolean> = _isSDKInForeground

    fun updateState(isForeground: Boolean) {
        _isSDKInForeground.value = isForeground
    }
}