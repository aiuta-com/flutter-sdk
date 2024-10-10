package com.aiuta.flutter.fashionsdk.utils

import kotlinx.serialization.json.Json

/**
 * Json instance for platform-native communication
 */
val json = Json {
    ignoreUnknownKeys = true
}