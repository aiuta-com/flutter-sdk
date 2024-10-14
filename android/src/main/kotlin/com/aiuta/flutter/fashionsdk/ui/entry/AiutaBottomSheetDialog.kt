package com.aiuta.flutter.fashionsdk.ui.entry

import android.app.Activity
import android.app.Activity.RESULT_CANCELED
import android.content.Intent
import android.content.IntentSender.SendIntentException
import android.os.Bundle
import android.os.Handler
import android.os.Looper
import android.view.View
import androidx.activity.compose.LocalActivityResultRegistryOwner
import androidx.activity.result.ActivityResultRegistry
import androidx.activity.result.ActivityResultRegistryOwner
import androidx.activity.result.IntentSenderRequest
import androidx.activity.result.contract.ActivityResultContract
import androidx.activity.result.contract.ActivityResultContracts.RequestMultiplePermissions.Companion.ACTION_REQUEST_PERMISSIONS
import androidx.activity.result.contract.ActivityResultContracts.RequestMultiplePermissions.Companion.EXTRA_PERMISSIONS
import androidx.activity.result.contract.ActivityResultContracts.StartActivityForResult.Companion.EXTRA_ACTIVITY_OPTIONS_BUNDLE
import androidx.activity.result.contract.ActivityResultContracts.StartIntentSenderForResult.Companion.ACTION_INTENT_SENDER_REQUEST
import androidx.activity.result.contract.ActivityResultContracts.StartIntentSenderForResult.Companion.EXTRA_INTENT_SENDER_REQUEST
import androidx.activity.result.contract.ActivityResultContracts.StartIntentSenderForResult.Companion.EXTRA_SEND_INTENT_EXCEPTION
import androidx.compose.foundation.layout.fillMaxSize
import androidx.compose.runtime.CompositionLocalProvider
import androidx.compose.runtime.remember
import androidx.compose.ui.Modifier
import androidx.compose.ui.platform.ComposeView
import androidx.compose.ui.platform.ViewCompositionStrategy
import androidx.core.app.ActivityCompat
import androidx.core.app.ActivityOptionsCompat
import androidx.lifecycle.lifecycleScope
import com.aiuta.fashionsdk.tryon.compose.domain.models.AiutaTryOnListeners
import com.aiuta.fashionsdk.tryon.compose.ui.AiutaTryOnFlow
import com.aiuta.fashionsdk.tryon.core.tryon
import com.aiuta.flutter.fashionsdk.domain.aiuta.AiutaConfigurationHolder
import com.aiuta.flutter.fashionsdk.domain.aiuta.AiutaHolder
import com.aiuta.flutter.fashionsdk.domain.listeners.actions.AiutaActionsListener
import com.aiuta.flutter.fashionsdk.domain.listeners.actions.addToCartClick
import com.aiuta.flutter.fashionsdk.domain.listeners.actions.addToWishListClick
import com.aiuta.flutter.fashionsdk.domain.listeners.product.AiutaUpdateProductListener
import com.aiuta.flutter.fashionsdk.domain.listeners.result.AiutaOnActivityResultListener
import com.aiuta.flutter.fashionsdk.domain.mappers.configuration.rememberAiutaTryOnConfigurationFromPlatform
import com.aiuta.flutter.fashionsdk.domain.mappers.configuration.theme.rememberAiutaThemeFromPlatform
import com.aiuta.flutter.fashionsdk.domain.mappers.product.toSKUItem
import com.google.android.material.bottomsheet.BottomSheetBehavior
import com.google.android.material.bottomsheet.BottomSheetDialog
import kotlinx.coroutines.flow.filterNotNull
import kotlinx.coroutines.flow.launchIn
import kotlinx.coroutines.flow.map
import kotlinx.coroutines.flow.onEach

class AiutaBottomSheetDialog(
    private val activity: Activity,
    private val activityResultListener: AiutaOnActivityResultListener,
    theme: Int,
) : BottomSheetDialog(activity, theme),
    ActivityResultRegistryOwner {

    private val aiuta by lazy { AiutaHolder.getAiuta() }
    private val aiutaTryOn by lazy { aiuta.tryon }

    private val aiutaTryOnListeners by lazy {
        AiutaTryOnListeners(
            addToWishlistClick = { skuItem ->
                AiutaActionsListener.addToWishListClick(skuItem)
            },
            addToCartClick = { skuItem ->
                AiutaActionsListener.addToCartClick(skuItem)
                dismiss()
            },
            closeClick = { dismiss() }
        )
    }

    // For launcher picker
    override val activityResultRegistry: ActivityResultRegistry =
        object : ActivityResultRegistry() {
            override fun <I, O> onLaunch(
                requestCode: Int,
                contract: ActivityResultContract<I, O>,
                input: I,
                options: ActivityOptionsCompat?
            ) {
                val activity = activity

                // Immediate result path
                val synchronousResult = contract.getSynchronousResult(activity, input)
                if (synchronousResult != null) {
                    Handler(Looper.getMainLooper()).post {
                        dispatchResult(
                            requestCode,
                            synchronousResult.value
                        )
                    }
                    return
                }

                // Start activity path
                val intent = contract.createIntent(activity, input)
                var optionsBundle: Bundle? = null
                // If there are any extras, we should defensively set the classLoader
                if (intent.extras != null && intent.extras!!.classLoader == null) {
                    intent.setExtrasClassLoader(activity.classLoader)
                }
                if (intent.hasExtra(EXTRA_ACTIVITY_OPTIONS_BUNDLE)) {
                    optionsBundle = intent.getBundleExtra(EXTRA_ACTIVITY_OPTIONS_BUNDLE)
                    intent.removeExtra(EXTRA_ACTIVITY_OPTIONS_BUNDLE)
                } else if (options != null) {
                    optionsBundle = options.toBundle()
                }
                if (ACTION_REQUEST_PERMISSIONS == intent.action) {
                    // requestPermissions path
                    var permissions = intent.getStringArrayExtra(EXTRA_PERMISSIONS)
                    if (permissions == null) {
                        permissions = arrayOfNulls(0)
                    }
                    ActivityCompat.requestPermissions(activity, permissions, requestCode)
                } else if (ACTION_INTENT_SENDER_REQUEST == intent.action) {
                    val request = intent.getParcelableExtra<IntentSenderRequest>(
                        EXTRA_INTENT_SENDER_REQUEST
                    )
                    try {
                        // startIntentSenderForResult path
                        ActivityCompat.startIntentSenderForResult(
                            activity, request!!.intentSender,
                            requestCode, request.fillInIntent, request.flagsMask,
                            request.flagsValues, 0, optionsBundle
                        )
                    } catch (e: SendIntentException) {
                        Handler(Looper.getMainLooper()).post {
                            dispatchResult(
                                requestCode, RESULT_CANCELED,
                                Intent().setAction(ACTION_INTENT_SENDER_REQUEST)
                                    .putExtra(EXTRA_SEND_INTENT_EXCEPTION, e)
                            )
                        }
                    }
                } else {
                    // startActivityForResult path
                    ActivityCompat.startActivityForResult(
                        activity,
                        intent,
                        requestCode,
                        optionsBundle
                    )
                }
            }
        }


    init {
        setContentView(composeView())
        behavior.state = BottomSheetBehavior.STATE_EXPANDED
        behavior.skipCollapsed = true

        // Start observing of actions
        observeActions()
        observeActivityResult()
    }

    private fun composeView(): View {
        return ComposeView(context).apply {
            setViewCompositionStrategy(ViewCompositionStrategy.DisposeOnViewTreeLifecycleDestroyed)
            setContent {
                CompositionLocalProvider(
                    LocalActivityResultRegistryOwner provides this@AiutaBottomSheetDialog
                ) {
                    val skuItem = remember { AiutaConfigurationHolder.getProduct().toSKUItem() }
                    val theme = rememberAiutaThemeFromPlatform(
                        configuration = AiutaConfigurationHolder.getConfiguration(),
                        assetManager = context.assets
                    )
                    val configuration = rememberAiutaTryOnConfigurationFromPlatform(
                        configuration = AiutaConfigurationHolder.getConfiguration(),
                    )

                    AiutaTryOnFlow(
                        modifier = Modifier.fillMaxSize(),
                        aiuta = { aiuta },
                        aiutaTryOn = { aiutaTryOn },
                        aiutaTryOnListeners = { aiutaTryOnListeners },
                        aiutaTryOnConfiguration = { configuration },
                        aiutaTheme = theme,
                        skuForGeneration = { skuItem }
                    )
                }
            }
        }
    }

    private fun observeActions() {
        AiutaUpdateProductListener
            .updatedActiveSKUItem
            .filterNotNull()
            .map { product -> product.toSKUItem() }
            .onEach { skuItem ->
                aiutaTryOnListeners.updateActiveSKUItem(skuItem)
            }
            .launchIn(lifecycleScope)
    }

    private fun observeActivityResult() {
        activityResultListener
            .activityResultFlow
            .filterNotNull()
            .onEach { incoming ->
                activityResultRegistry.dispatchResult(
                    requestCode = incoming.requestCode,
                    resultCode = incoming.resultCode,
                    data = incoming.data
                )
            }
            .launchIn(lifecycleScope)
    }
}