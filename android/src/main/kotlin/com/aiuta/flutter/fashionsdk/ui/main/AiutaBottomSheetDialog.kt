package com.aiuta.flutter.fashionsdk.ui.main

import android.app.Activity
import androidx.compose.foundation.layout.fillMaxSize
import androidx.compose.foundation.shape.RoundedCornerShape
import androidx.compose.runtime.remember
import androidx.compose.ui.Modifier
import androidx.compose.ui.draw.clip
import androidx.compose.ui.input.nestedscroll.nestedScroll
import androidx.compose.ui.platform.rememberNestedScrollInteropConnection
import androidx.compose.ui.unit.dp
import com.aiuta.fashionsdk.tryon.compose.ui.AiutaTryOnFlow
import com.aiuta.flutter.fashionsdk.domain.aiuta.AiutaConfigurationHolder
import com.aiuta.flutter.fashionsdk.domain.aiuta.AiutaTryOnConfigurationHolder
import com.aiuta.flutter.fashionsdk.domain.listeners.result.AiutaOnActivityResultListener
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
                configuration = AiutaConfigurationHolder.getPlatformConfiguration(),
                assetManager = context.assets
            )
            val configuration = remember {
                AiutaTryOnConfigurationHolder.getTryOnConfiguration()
            }

            AiutaTryOnFlow(
                modifier = Modifier
                    .fillMaxSize()
                    .clip(RoundedCornerShape(topStart = 12.dp, topEnd = 12.dp))
                    .nestedScroll(rememberNestedScrollInteropConnection()),
                aiutaTryOnListeners = aiutaTryOnListeners,
                aiutaTryOnConfiguration = configuration,
                aiutaTheme = aiutaTheme,
                skuForGeneration = skuItem,
            )
        }
    }
}