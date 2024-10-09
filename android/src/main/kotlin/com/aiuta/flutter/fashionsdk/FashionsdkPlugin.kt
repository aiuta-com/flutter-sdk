package com.aiuta.flutter.fashionsdk

import android.app.Activity
import android.content.Intent
import android.util.Log
import androidx.lifecycle.Lifecycle
import androidx.lifecycle.LifecycleOwner
import androidx.lifecycle.LifecycleRegistry
import com.aiuta.flutter.fashionsdk.domain.models.configuration.PlatformAiutaConfiguration
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

/** FashionsdkPlugin */
class FashionsdkPlugin : FlutterPlugin, MethodCallHandler, ActivityAware, LifecycleOwner {

    private lateinit var channel: MethodChannel
    private var activity: Activity? = null

    private val lifecycleRegistry = LifecycleRegistry(this)
    override val lifecycle: Lifecycle = lifecycleRegistry

    override fun onAttachedToEngine(flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
        channel = MethodChannel(flutterPluginBinding.binaryMessenger, "aiutasdk")
        channel.setMethodCallHandler(this)
    }

    // TODO Migrate to domain
    private val json = Json {
        ignoreUnknownKeys = true
    }

    override fun onMethodCall(call: MethodCall, result: Result) {
        Log.d("TAG_CHECK", "onMethodCall()")
        when (call.method) {
            "startAiutaFlow" -> {
                activity?.let { localActivity ->
                    localActivity.startActivity(
                        Intent(localActivity, AiutaActivity::class.java)
                    )

                    val rawProduct = call.argument<String>("product")
                    val rawConfiguration = call.argument<String>("configuration")

                    Log.d("TAG_CHECK", "received skuItem - $rawProduct")
                    Log.d("TAG_CHECK", "received configuration - $rawConfiguration")

                    val configuration = rawConfiguration?.let {
                        json.decodeFromString<PlatformAiutaConfiguration>(rawConfiguration)
                    }

                    Log.d("TAG_CHECK", "parsed configuration - $configuration")

                }
            }

            "startAiutaBottomSheetFlow" -> {
                activity?.let { localActivity ->
                    val bottomSheet = AiutaBottomSheetDialog(
                        localActivity,
                        R.style.AiutaBottomSheetDialogTheme
                    )
                    bottomSheet.show()
                }
            }

            "startAiutaShareAssetFlow" -> {
                activity?.let { localActivity ->
                    localActivity.startActivity(
                        Intent(localActivity, AiutaShareAssetsActivity::class.java)
                    )
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
