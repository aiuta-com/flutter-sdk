package com.aiuta.flutter.fashionsdk.ui.main

import android.app.Activity
import androidx.compose.foundation.layout.fillMaxSize
import androidx.compose.runtime.remember
import androidx.compose.ui.Modifier
import androidx.compose.ui.input.nestedscroll.nestedScroll
import androidx.compose.ui.platform.rememberNestedScrollInteropConnection
import com.aiuta.fashionsdk.tryon.compose.ui.AiutaTryOnFlow
import com.aiuta.flutter.fashionsdk.domain.aiuta.AiutaConfigurationHolder
import com.aiuta.flutter.fashionsdk.domain.listeners.result.AiutaOnActivityResultListener
import com.aiuta.flutter.fashionsdk.domain.mappers.configuration.rememberAiutaTryOnConfigurationFromPlatform
import com.aiuta.flutter.fashionsdk.domain.mappers.configuration.theme.rememberAiutaThemeFromPlatform
import com.aiuta.flutter.fashionsdk.domain.mappers.product.toSKUItem
import com.aiuta.flutter.fashionsdk.ui.base.BaseAiutaBottomSheetDialog

class AiutaBottomSheetDialog(
    activity: Activity,
    activityResultListener: AiutaOnActivityResultListener,
    theme: Int,
) : BaseAiutaBottomSheetDialog(activity, activityResultListener, theme) {

    init {
        setContent {
            val skuItem = remember { AiutaConfigurationHolder.getProduct().toSKUItem() }
            val aiutaTheme = rememberAiutaThemeFromPlatform(
                configuration = AiutaConfigurationHolder.getConfiguration(),
                assetManager = context.assets
            )
            val configuration = rememberAiutaTryOnConfigurationFromPlatform(
                configuration = AiutaConfigurationHolder.getConfiguration(),
            )

            AiutaTryOnFlow(
                modifier = Modifier
                    .fillMaxSize()
                    .nestedScroll(rememberNestedScrollInteropConnection()),
                aiuta = { aiuta },
                aiutaTryOn = { aiutaTryOn },
                aiutaTryOnListeners = { aiutaTryOnListeners },
                aiutaTryOnConfiguration = { configuration },
                aiutaTheme = aiutaTheme,
                skuForGeneration = { skuItem }
            )
        }
    }
}