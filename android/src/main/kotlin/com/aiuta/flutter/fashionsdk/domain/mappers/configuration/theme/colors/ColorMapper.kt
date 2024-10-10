package com.aiuta.flutter.fashionsdk.domain.mappers.configuration.theme.colors

import android.util.Log
import androidx.compose.ui.graphics.Color

// Extension function to convert ARGB string to Color
internal fun String.toColor(): Color {
    // TODO
    Log.d("TAG_CHECK", "Try to parse color - $this")
    return Color(android.graphics.Color.parseColor(this))
}