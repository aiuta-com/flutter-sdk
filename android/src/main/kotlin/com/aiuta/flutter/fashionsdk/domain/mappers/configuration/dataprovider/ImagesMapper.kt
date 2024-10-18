package com.aiuta.flutter.fashionsdk.domain.mappers.configuration.dataprovider

import com.aiuta.fashionsdk.tryon.compose.domain.models.dataprovider.AiutaGeneratedImage
import com.aiuta.fashionsdk.tryon.compose.domain.models.dataprovider.AiutaUploadedImage
import com.aiuta.flutter.fashionsdk.domain.models.configuration.dataprovider.PlatformAiutaGeneratedImage
import com.aiuta.flutter.fashionsdk.domain.models.configuration.dataprovider.PlatformAiutaUploadedImage

// Uploaded
fun PlatformAiutaUploadedImage.toAiutaUploadedImage(): AiutaUploadedImage {
    return AiutaUploadedImage(id = id, url = url)
}

fun AiutaUploadedImage.toPlatformAiutaUploadedImage(): PlatformAiutaUploadedImage {
    return PlatformAiutaUploadedImage(id = id, url = url)
}

// Generated
fun PlatformAiutaGeneratedImage.toAiutaUploadedImage(): AiutaGeneratedImage {
    return AiutaGeneratedImage(url = url)
}

fun AiutaGeneratedImage.toPlatformAiutaGeneratedImage(): PlatformAiutaGeneratedImage {
    return PlatformAiutaGeneratedImage(url = url)
}