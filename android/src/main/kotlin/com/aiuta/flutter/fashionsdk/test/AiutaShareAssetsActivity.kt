package com.aiuta.flutter.fashionsdk.test

import android.content.res.AssetFileDescriptor
import android.graphics.drawable.Drawable
import android.os.Bundle
import android.util.Log
import androidx.activity.ComponentActivity
import androidx.activity.compose.setContent
import androidx.compose.foundation.Image
import coil.compose.rememberAsyncImagePainter
import io.flutter.FlutterInjector

@Deprecated("Delete it")
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