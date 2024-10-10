package com.aiuta.flutter.fashionsdk.domain.mappers.configuration.theme.colors

import androidx.compose.ui.graphics.Color

// Extension function to convert ARGB string to Color
internal fun String.toColor(): Color {
    return Color(android.graphics.Color.parseColor(this))
}