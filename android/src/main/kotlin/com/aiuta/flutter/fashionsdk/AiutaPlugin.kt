package com.aiuta.flutter.fashionsdk

import android.app.Activity
import android.content.Intent
import android.util.Log
import androidx.lifecycle.Lifecycle
import androidx.lifecycle.LifecycleOwner
import androidx.lifecycle.LifecycleRegistry
import com.aiuta.flutter.fashionsdk.domain.aiuta.AiutaConfigurationHolder
import com.aiuta.flutter.fashionsdk.domain.aiuta.AiutaHolder
import com.aiuta.flutter.fashionsdk.domain.aiuta.initAiutaConfigurationHolder
import com.aiuta.flutter.fashionsdk.domain.models.configuration.PlatformAiutaConfiguration
import com.aiuta.flutter.fashionsdk.domain.models.configuration.mode.PlatformAiutaMode
import com.aiuta.flutter.fashionsdk.ui.entry.AiutaBottomSheetDialog
import com.aiuta.flutter.fashionsdk.test.AiutaShareAssetsActivity
import com.aiuta.flutter.fashionsdk.ui.entry.AiutaActivity
import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.embedding.engine.plugins.activity.ActivityAware
import io.flutter.embedding.engine.plugins.activity.ActivityPluginBinding
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result
import kotlinx.serialization.json.Json

/** AiutaPlugin */
class AiutaPlugin : FlutterPlugin, MethodCallHandler, ActivityAware, LifecycleOwner {

    private lateinit var channel: MethodChannel
    private var activity: Activity? = null

    private val lifecycleRegistry = LifecycleRegistry(this)
    override val lifecycle: Lifecycle = lifecycleRegistry

    override fun onAttachedToEngine(flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
        channel = MethodChannel(flutterPluginBinding.binaryMessenger, "aiutasdk")
        channel.setMethodCallHandler(this)
    }

    override fun onMethodCall(call: MethodCall, result: Result) {
        when (call.method) {
            "startAiutaFlow" -> {
                activity?.let { localActivity ->
                    // Init configuration
                    initAiutaConfigurationHolder {
                        setConfiguration(call.argument<String>(CONFIGURATION_KEY))
                        setProduct(call.argument<String>(PRODUCT_KEY))
                    }

                    // Set Aiuta
                    val configuration = AiutaConfigurationHolder.getConfiguration()
                    AiutaHolder.setAiuta(
                        aiutaBuilder = AiutaApplication.aiutaBuilder,
                        platformAiutaConfiguration = configuration,
                    )

                    if (configuration.mode == PlatformAiutaMode.FULL_SCREEN) {
                        localActivity.startActivity(
                            Intent(
                                localActivity,
                                AiutaActivity::class.java
                            )
                        )
                    } else {
                        val bottomSheet = AiutaBottomSheetDialog(
                            localActivity,
                            R.style.AiutaBottomSheetDialogTheme
                        )
                        bottomSheet.show()
                    }
                }
            }

            else -> {
                result.notImplemented()
            }
        }
    }

    override fun onDetachedFromEngine(binding: FlutterPlugin.FlutterPluginBinding) {
        channel.setMethodCallHandler(null)
    }

    override fun onAttachedToActivity(binding: ActivityPluginBinding) {
        activity = binding.activity

        lifecycleRegistry.currentState = Lifecycle.State.CREATED
    }

    override fun onDetachedFromActivityForConfigChanges() {
        activity = null

        lifecycleRegistry.currentState = Lifecycle.State.DESTROYED
    }

    override fun onReattachedToActivityForConfigChanges(binding: ActivityPluginBinding) {
        activity = binding.activity

        lifecycleRegistry.currentState = Lifecycle.State.CREATED
    }

    override fun onDetachedFromActivity() {
        activity = null

        lifecycleRegistry.currentState = Lifecycle.State.DESTROYED
    }
}