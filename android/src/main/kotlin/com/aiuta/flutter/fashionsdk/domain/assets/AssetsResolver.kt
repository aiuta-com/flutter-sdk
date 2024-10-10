package com.aiuta.flutter.fashionsdk.domain.assets

import android.content.res.AssetFileDescriptor
import android.content.res.AssetManager
import android.graphics.Typeface
import android.graphics.drawable.Drawable
import androidx.compose.ui.text.font.Font
import androidx.compose.ui.text.font.FontFamily
import io.flutter.FlutterInjector

object AssetsResolver {
    private val loader by lazy { FlutterInjector.instance().flutterLoader() }

    fun resolveDrawable(
        assetManager: AssetManager,
        path: String
    ): Drawable {
        val drawableKey = getResourceKey(path)

        val logoRes = assetManager.openFd(drawableKey)
        val stream = AssetFileDescriptor.AutoCloseInputStream(logoRes)
        val drawable = Drawable.createFromStream(stream, null)

        return checkNotNull(drawable) {
            "AssetsResolver: failed to solve drawable from path $path"
        }
    }

    fun resolveFontFamily(
        assetManager: AssetManager,
        path: String
    ): FontFamily {
        val fontKey = getResourceKey(path)
        val typeface = Typeface.createFromAsset(assetManager, fontKey)

        return FontFamily(typeface)
    }

    private fun getResourceKey(path: String): String {
        return loader.getLookupKeyForAsset(path)
    }
}