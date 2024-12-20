package com.aiuta.flutter.fashionsdk.domain.listeners.dataprovider

import com.aiuta.fashionsdk.tryon.compose.domain.models.configuration.dataprovider.AiutaHistoryImage
import com.aiuta.fashionsdk.tryon.compose.domain.models.configuration.dataprovider.SupplementaryConsent
import com.aiuta.flutter.fashionsdk.domain.mappers.configuration.dataprovider.toPlatform
import com.aiuta.flutter.fashionsdk.domain.models.actions.PlatformAddGeneratedImageAction
import com.aiuta.flutter.fashionsdk.domain.models.actions.PlatformAddUploadedImageAction
import com.aiuta.flutter.fashionsdk.domain.models.actions.PlatformAiutaDataProviderAction
import com.aiuta.flutter.fashionsdk.domain.models.actions.PlatformDeleteGeneratedImageAction
import com.aiuta.flutter.fashionsdk.domain.models.actions.PlatformDeleteUploadedImageAction
import com.aiuta.flutter.fashionsdk.domain.models.actions.PlatformObtainUserConsentAction
import com.aiuta.flutter.fashionsdk.domain.models.actions.PlatformSelectUploadedImageAction
import kotlinx.serialization.encodeToString
import kotlinx.serialization.json.Json


fun AiutaDataProviderListener.obtainUserConsent(supplementaryConsents: List<SupplementaryConsent>) {
    val action = PlatformObtainUserConsentAction(
        supplementaryConsents = supplementaryConsents.map { it.toPlatform() }
    )
    sendEvent(Json.encodeToString<PlatformAiutaDataProviderAction>(action))
}

fun AiutaDataProviderListener.addUploadedImage(uploadedImages: List<AiutaHistoryImage>) {
    val action = PlatformAddUploadedImageAction(
        uploadedImages = uploadedImages.map { it.toPlatform() }
    )
    sendEvent(Json.encodeToString<PlatformAiutaDataProviderAction>(action))
}

fun AiutaDataProviderListener.selectUploadedImage(uploadedImage: AiutaHistoryImage) {
    val action = PlatformSelectUploadedImageAction(uploadedImage = uploadedImage.toPlatform())
    sendEvent(Json.encodeToString<PlatformAiutaDataProviderAction>(action))
}

fun AiutaDataProviderListener.deleteUploadedImage(uploadedImages: List<AiutaHistoryImage>) {
    val action = PlatformDeleteUploadedImageAction(
        uploadedImages = uploadedImages.map { it.toPlatform() }
    )
    sendEvent(Json.encodeToString<PlatformAiutaDataProviderAction>(action))
}

fun AiutaDataProviderListener.addGeneratedImage(
    productId: String,
    generatedImages: List<AiutaHistoryImage>
) {
    val action = PlatformAddGeneratedImageAction(
        productId = productId,
        generatedImages = generatedImages.map { it.toPlatform() }
    )
    sendEvent(Json.encodeToString<PlatformAiutaDataProviderAction>(action))
}

fun AiutaDataProviderListener.deleteGeneratedImage(generatedImages: List<AiutaHistoryImage>) {
    val action = PlatformDeleteGeneratedImageAction(
        generatedImages = generatedImages.map { it.toPlatform() }
    )
    sendEvent(Json.encodeToString<PlatformAiutaDataProviderAction>(action))
}