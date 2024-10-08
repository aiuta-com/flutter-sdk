package com.aiuta.flutter.fashionsdk.test

import android.content.res.AssetFileDescriptor
import android.graphics.drawable.Drawable
import android.os.Bundle
import android.util.Log
import androidx.activity.ComponentActivity
import androidx.activity.compose.setContent
import androidx.compose.foundation.Image
import androidx.compose.runtime.remember
import coil.compose.rememberAsyncImagePainter
import com.aiuta.fashionsdk.tryon.compose.domain.models.SKUItem
import com.aiuta.flutter.fashionsdk.AiutaTryOnFlutterListener
import io.flutter.FlutterInjector
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.embedding.engine.dart.DartExecutor
import io.flutter.plugin.common.EventChannel

class AiutaShareAssetsActivity: ComponentActivity() {

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)

        val loader = FlutterInjector.instance().flutterLoader()
        val logoKey = loader.getLookupKeyForAsset("res/icons/aiuta_logo.png")

        val logoRes = assets.openFd(logoKey)
        val stream = AssetFileDescriptor.AutoCloseInputStream(logoRes)

        val logoDrawable = Drawable.createFromStream(stream, null)


        Log.d("TAG_CHECK", "logoKey - $logoKey")
        Log.d("TAG_CHECK", "logoDrawable - $logoDrawable")


        setContent {
            Image(
                painter = rememberAsyncImagePainter(model = logoDrawable),
                contentDescription = null
            )
        }

    }
}