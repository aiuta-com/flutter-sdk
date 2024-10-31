package com.aiuta.flutter.fashionsdk.domain.assets

import android.content.res.AssetFileDescriptor
import android.content.res.AssetManager
import android.graphics.Typeface
import android.graphics.drawable.Drawable
import android.util.Log
import androidx.compose.ui.text.font.Font
import androidx.compose.ui.text.font.FontFamily
import androidx.compose.ui.text.font.FontStyle
import androidx.compose.ui.text.font.FontWeight
import com.aiuta.flutter.fashionsdk.domain.mappers.configuration.theme.typography.toFont
import com.aiuta.flutter.fashionsdk.domain.models.configuration.theme.typography.PlatformAiutaFont
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
        familyFonts: List<PlatformAiutaFont>
    ): FontFamily {
        return FontFamily(
            familyFonts.map { platformFont ->
                platformFont.toFont(
                    resourceKey = getResourceKey(platformFont.filePath),
                    assetManager = assetManager,
                )
            }
        )
    }

    private fun getResourceKey(path: String): String {
        return loader.getLookupKeyForAsset(path)
    }
}