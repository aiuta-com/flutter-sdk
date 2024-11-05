package com.aiuta.flutter.fashionsdk

import android.app.Activity
import android.app.Activity.RESULT_OK
import android.content.Intent
import androidx.activity.result.contract.ActivityResultContracts.RequestMultiplePermissions.Companion.EXTRA_PERMISSIONS
import androidx.activity.result.contract.ActivityResultContracts.RequestMultiplePermissions.Companion.EXTRA_PERMISSION_GRANT_RESULTS
import androidx.lifecycle.Lifecycle
import androidx.lifecycle.LifecycleOwner
import androidx.lifecycle.LifecycleRegistry
import com.aiuta.fashionsdk.Aiuta
import com.aiuta.flutter.fashionsdk.domain.aiuta.AiutaConfigurationHolder
import com.aiuta.flutter.fashionsdk.domain.aiuta.AiutaConfigurationHolder.PRODUCT_KEY
import com.aiuta.flutter.fashionsdk.domain.aiuta.AiutaHolder
import com.aiuta.flutter.fashionsdk.domain.aiuta.initAiutaConfigurationHolder
import com.aiuta.flutter.fashionsdk.domain.listeners.actions.AiutaActionsListener
import com.aiuta.flutter.fashionsdk.domain.listeners.analytic.AiutaAnalyticListener
import com.aiuta.flutter.fashionsdk.domain.listeners.auth.AiutaJWTAuthenticationListener
import com.aiuta.flutter.fashionsdk.domain.listeners.dataprovider.AiutaDataProviderHandler
import com.aiuta.flutter.fashionsdk.domain.listeners.dataprovider.AiutaDataProviderListener
import com.aiuta.flutter.fashionsdk.domain.listeners.error.AiutaErrorListener
import com.aiuta.flutter.fashionsdk.domain.listeners.product.AiutaUpdateProductListener
import com.aiuta.flutter.fashionsdk.domain.listeners.result.AiutaOnActivityResultListener
import com.aiuta.flutter.fashionsdk.domain.models.configuration.PlatformAiutaConfiguration
import com.aiuta.flutter.fashionsdk.domain.models.configuration.mode.PlatformAiutaMode
import com.aiuta.flutter.fashionsdk.ui.history.AiutaHistoryActivity
import com.aiuta.flutter.fashionsdk.ui.history.AiutaHistoryBottomSheetDialog
import com.aiuta.flutter.fashionsdk.ui.main.AiutaActivity
import com.aiuta.flutter.fashionsdk.ui.main.AiutaBottomSheetDialog
import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.embedding.engine.plugins.activity.ActivityAware
import io.flutter.embedding.engine.plugins.activity.ActivityPluginBinding
import io.flutter.plugin.common.EventChannel
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result

/** AiutaPlugin */
class AiutaPlugin : FlutterPlugin, MethodCallHandler, ActivityAware, LifecycleOwner {

    private lateinit var mainChannel: MethodChannel
    private lateinit var analyticChannel: EventChannel
    private lateinit var actionChannel: EventChannel
    private lateinit var authChannel: EventChannel
    private lateinit var dataProviderChannel: EventChannel
    private var activity: Activity? = null

    private val lifecycleRegistry = LifecycleRegistry(this)
    override val lifecycle: Lifecycle = lifecycleRegistry

    private val activityResultListener by lazy { AiutaOnActivityResultListener() }

    override fun onAttachedToEngine(flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
        mainChannel = MethodChannel(flutterPluginBinding.binaryMessenger, KEY_MAIN_CHANNEL)
        mainChannel.setMethodCallHandler(this)

        // Init action handler
        analyticChannel = EventChannel(
            flutterPluginBinding.binaryMessenger,
            AiutaAnalyticListener.keyChannel
        )
        analyticChannel.setStreamHandler(AiutaAnalyticListener)

        // Init action handler
        actionChannel = EventChannel(
            flutterPluginBinding.binaryMessenger,
            AiutaActionsListener.keyChannel
        )
        actionChannel.setStreamHandler(AiutaActionsListener)

        // Init auth handler
        authChannel = EventChannel(
            flutterPluginBinding.binaryMessenger,
            AiutaJWTAuthenticationListener.keyChannel
        )
        authChannel.setStreamHandler(AiutaJWTAuthenticationListener)

        // Init data provider handler
        dataProviderChannel = EventChannel(
            flutterPluginBinding.binaryMessenger,
            AiutaDataProviderListener.keyChannel
        )
        dataProviderChannel.setStreamHandler(AiutaDataProviderListener)
    }

    override fun onMethodCall(call: MethodCall, result: Result) {
        when (call.method) {
            // Main flow
            "startAiutaFlow" -> {
                activity?.let { localActivity ->
                    call.aiutaScope(localActivity) { configuration ->
                        if (configuration.mode == PlatformAiutaMode.FULL_SCREEN) {
                            localActivity.startActivity(
                                Intent(
                                    localActivity,
                                    AiutaActivity::class.java
                                )
                            )
                        } else {
                            val bottomSheet = AiutaBottomSheetDialog(
                                activity = localActivity,
                                activityResultListener = activityResultListener,
                                theme = R.style.AiutaBottomSheetDialogTheme
                            )
                            bottomSheet.show()
                        }
                    }
                    result.success(null)
                }
            }

            "startHistoryFlow" -> {
                activity?.let { localActivity ->
                    call.aiutaScope(localActivity) { configuration ->
                        if (configuration.mode == PlatformAiutaMode.FULL_SCREEN) {
                            localActivity.startActivity(
                                Intent(
                                    localActivity,
                                    AiutaHistoryActivity::class.java
                                )
                            )
                        } else {
                            val bottomSheet = AiutaHistoryBottomSheetDialog(
                                activity = localActivity,
                                activityResultListener = activityResultListener,
                                theme = R.style.AiutaBottomSheetDialogTheme
                            )
                            bottomSheet.show()
                        }
                    }
                    result.success(null)
                }
            }

            // Actions handling
            "updateActiveAiutaProduct" -> {
                val rawProduct = call.argument<String>(PRODUCT_KEY)
                rawProduct?.let {
                    AiutaUpdateProductListener.updateActiveSKUItem(
                        rawProduct = rawProduct
                    )
                }
                result.success(null)
            }

            // Data providing handling
            "updateUserConsent" -> {
                val isUserConsentObtained = call.argument<Boolean>(
                    AiutaDataProviderListener.IS_USER_CONSENT_OBTAINED_KEY
                )
                isUserConsentObtained?.let { AiutaDataProviderHandler.updateIsUserConsentObtained(it) }
                result.success(null)
            }

            "updateUploadedImages" -> {
                val rawUploadedImages = call.argument<String>(
                    AiutaDataProviderListener.UPLOADED_IMAGES_KEY
                )
                rawUploadedImages?.let { AiutaDataProviderHandler.updateUploadedImages(it) }
                result.success(null)
            }

            "updateGeneratedImages" -> {
                val rawGeneratedImages = call.argument<String>(
                    AiutaDataProviderListener.GENERATED_IMAGES_KEY
                )
                rawGeneratedImages?.let { AiutaDataProviderHandler.updateGeneratedImages(it) }
                result.success(null)
            }

            // Auth action handling
            "resolveJWTAuth" -> {
                val jwt = call.argument<String>("jwt")
                jwt?.let { AiutaHolder.resolveJWT(jwt) }
                result.success(null)
            }

            // Error handling
            "notifyAboutError" -> {
                val rawError = call.argument<String>(
                    AiutaErrorListener.ERROR_TYPE_ARGUMENT
                )
                rawError?.let { AiutaErrorListener.notifyAboutError(it) }
            }

            else -> {
                result.notImplemented()
            }
        }
    }

    override fun onDetachedFromEngine(binding: FlutterPlugin.FlutterPluginBinding) {
        mainChannel.setMethodCallHandler(null)
        analyticChannel.setStreamHandler(null)
        actionChannel.setStreamHandler(null)
        authChannel.setStreamHandler(null)
        dataProviderChannel.setStreamHandler(null)
    }

    override fun onAttachedToActivity(binding: ActivityPluginBinding) {
        activity = binding.activity

        // Add listener for result
        binding.addActivityResultListener { requestCode, resultCode, data ->
            activityResultListener.onActivityResult(requestCode, resultCode, data)
            true
        }
        // Add listener for permissions
        binding.addRequestPermissionsResultListener { requestCode, permissions, grantResults ->
            activityResultListener.onActivityResult(
                requestCode,
                RESULT_OK,
                Intent()
                    .putExtra(EXTRA_PERMISSIONS, permissions)
                    .putExtra(EXTRA_PERMISSION_GRANT_RESULTS, grantResults)
            )
            true
        }

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

    private inline fun MethodCall.aiutaScope(
        activity: Activity,
        block: (configuration: PlatformAiutaConfiguration) -> Unit,
    ) {
        // Init configuration
        initAiutaConfigurationHolder {
            setConfiguration(argument<String>(CONFIGURATION_KEY))
            setProduct(argument<String>(PRODUCT_KEY))
        }

        // Set Aiuta
        val configuration = AiutaConfigurationHolder.getConfiguration()
        AiutaHolder.setAiuta(
            aiutaBuilder = Aiuta.Builder().setApplication(activity.application),
            platformAiutaConfiguration = configuration,
        )

        // Execute block
        block(configuration)
    }

    private companion object {
        private const val KEY_MAIN_CHANNEL = "aiutasdk"
    }
}
