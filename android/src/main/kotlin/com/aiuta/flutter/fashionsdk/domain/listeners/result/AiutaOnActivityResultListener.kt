package com.aiuta.flutter.fashionsdk.domain.listeners.result

import android.content.Intent
import kotlinx.coroutines.flow.MutableStateFlow
import kotlinx.coroutines.flow.StateFlow

class AiutaOnActivityResultListener {

    private val _activityResultFlow: MutableStateFlow<InternalActivityResult?> =
        MutableStateFlow(null)
    val activityResultFlow: StateFlow<InternalActivityResult?> = _activityResultFlow

    fun onActivityResult(requestCode: Int, resultCode: Int,  data: Intent?) {
        _activityResultFlow.value = InternalActivityResult(
            requestCode = requestCode,
            resultCode = resultCode,
            data = data
        )
    }

    fun clean() {
        _activityResultFlow.value = null
    }

    class InternalActivityResult(
        val requestCode: Int,
        val resultCode: Int,
        val data: Intent?
    )
}