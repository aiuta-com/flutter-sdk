package com.aiuta.flutter.fashionsdk.domain.listeners.dataprovider

import com.aiuta.fashionsdk.tryon.compose.domain.models.dataprovider.AiutaGeneratedImage
import com.aiuta.fashionsdk.tryon.compose.domain.models.dataprovider.AiutaUploadedImage
import com.aiuta.flutter.fashionsdk.domain.mappers.configuration.dataprovider.toPlatformAiutaGeneratedImage
import com.aiuta.flutter.fashionsdk.domain.mappers.configuration.dataprovider.toPlatformAiutaUploadedImage
import com.aiuta.flutter.fashionsdk.domain.models.actions.PlatformAddGeneratedImageAction
import com.aiuta.flutter.fashionsdk.domain.models.actions.PlatformAddUploadedImageAction
import com.aiuta.flutter.fashionsdk.domain.models.actions.PlatformAiutaAuthAction
import com.aiuta.flutter.fashionsdk.domain.models.actions.PlatformAiutaDataProviderAction
import com.aiuta.flutter.fashionsdk.domain.models.actions.PlatformDeleteGeneratedImageAction
import com.aiuta.flutter.fashionsdk.domain.models.actions.PlatformDeleteUploadedImageAction
import com.aiuta.flutter.fashionsdk.domain.models.actions.PlatformObtainUserConsentAction
import com.aiuta.flutter.fashionsdk.domain.models.actions.PlatformRequestJWTAction
import com.aiuta.flutter.fashionsdk.domain.models.actions.PlatformSelectUploadedImageAction
import kotlinx.serialization.encodeToString
import kotlinx.serialization.json.Json


fun AiutaDataProviderListener.obtainUserConsent() {
    val action = PlatformObtainUserConsentAction()
    sendEvent(Json.encodeToString<PlatformAiutaDataProviderAction>(action))
}

fun AiutaDataProviderListener.addUploadedImage(uploadedImages: List<AiutaUploadedImage>) {
    val action = PlatformAddUploadedImageAction(
        uploadedImages = uploadedImages.map { it.toPlatformAiutaUploadedImage() }
    )
    sendEvent(Json.encodeToString<PlatformAiutaDataProviderAction>(action))
}

fun AiutaDataProviderListener.selectUploadedImage(uploadedImage: AiutaUploadedImage) {
    val action = PlatformSelectUploadedImageAction(uploadedImage = uploadedImage.toPlatformAiutaUploadedImage())
    sendEvent(Json.encodeToString<PlatformAiutaDataProviderAction>(action))
}

fun AiutaDataProviderListener.deleteUploadedImage(uploadedImages: List<AiutaUploadedImage>) {
    val action = PlatformDeleteUploadedImageAction(
        uploadedImages = uploadedImages.map { it.toPlatformAiutaUploadedImage() }
    )
    sendEvent(Json.encodeToString<PlatformAiutaDataProviderAction>(action))
}

fun AiutaDataProviderListener.addGeneratedImage(generatedImages: List<AiutaGeneratedImage>) {
    val action = PlatformAddGeneratedImageAction(
        generatedImages = generatedImages.map { it.toPlatformAiutaGeneratedImage() }
    )
    sendEvent(Json.encodeToString<PlatformAiutaDataProviderAction>(action))
}

fun AiutaDataProviderListener.deleteGeneratedImage(generatedImages: List<AiutaGeneratedImage>) {
    val action = PlatformDeleteGeneratedImageAction(
        generatedImages = generatedImages.map { it.toPlatformAiutaGeneratedImage() }
    )
    sendEvent(Json.encodeToString<PlatformAiutaDataProviderAction>(action))
}