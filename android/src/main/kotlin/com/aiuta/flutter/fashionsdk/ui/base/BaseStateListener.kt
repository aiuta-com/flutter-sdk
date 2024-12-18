package com.aiuta.flutter.fashionsdk.ui.base

import androidx.compose.runtime.Composable
import androidx.compose.runtime.DisposableEffect
import androidx.lifecycle.Lifecycle
import androidx.lifecycle.LifecycleEventObserver
import androidx.lifecycle.compose.LocalLifecycleOwner
import com.aiuta.flutter.fashionsdk.domain.listeners.state.AiutaSDKStateListener

@Composable
fun BaseStateListener() {
    val lifecycleOwner = LocalLifecycleOwner.current

    DisposableEffect(lifecycleOwner) {
        val observer =
            LifecycleEventObserver { _, event ->
                if (event == Lifecycle.Event.ON_RESUME) {
                    AiutaSDKStateListener.updateState(isForeground = true)
                } else if (event == Lifecycle.Event.ON_DESTROY) {
                    AiutaSDKStateListener.updateState(isForeground = false)
                }
            }

        // Add the observer to the lifecycle
        lifecycleOwner.lifecycle.addObserver(observer)

        // When the effect leaves the Composition, remove the observer
        onDispose {
            lifecycleOwner.lifecycle.removeObserver(observer)
        }
    }
}