package com.aiuta.flutter.fashionsdk.domain.mappers.configuration.dataprovider

import com.aiuta.fashionsdk.tryon.compose.domain.models.configuration.dataprovider.AiutaDataProvider
import com.aiuta.flutter.fashionsdk.domain.listeners.dataprovider.AiutaDataProviderHandler
import com.aiuta.flutter.fashionsdk.domain.listeners.dataprovider.AiutaDataProviderListener
import com.aiuta.flutter.fashionsdk.domain.listeners.dataprovider.addGeneratedImage
import com.aiuta.flutter.fashionsdk.domain.listeners.dataprovider.addUploadedImage
import com.aiuta.flutter.fashionsdk.domain.listeners.dataprovider.deleteGeneratedImage
import com.aiuta.flutter.fashionsdk.domain.listeners.dataprovider.deleteUploadedImage
import com.aiuta.flutter.fashionsdk.domain.listeners.dataprovider.obtainUserConsent
import com.aiuta.flutter.fashionsdk.domain.listeners.dataprovider.selectUploadedImage
import com.aiuta.flutter.fashionsdk.domain.listeners.error.AiutaErrorListener
import com.aiuta.flutter.fashionsdk.domain.models.configuration.dataprovider.PlatformAiutaDataProvider

fun PlatformAiutaDataProvider.toAiutaDataProvider(): AiutaDataProvider {
    // Update with current
    AiutaDataProviderHandler.updateIsUserConsentObtained(isUserConsentObtained)
    AiutaDataProviderHandler.updateGeneratedImages(generatedImages.orEmpty())
    AiutaDataProviderHandler.updateUploadedImages(uploadedImages.orEmpty())

    return AiutaDataProvider(
        // Consent
        isUserConsentObtainedFlow = AiutaDataProviderHandler.isUserConsentObtainedFlow,
        obtainUserConsentAction = AiutaDataProviderListener::obtainUserConsent,
        // Generated images
        generatedImagesFlow = AiutaDataProviderHandler.generatedImagesFlow,
        addGeneratedImagesAction = AiutaDataProviderListener::addGeneratedImage,
        isErrorDeletingGeneratedImagesFlow = AiutaErrorListener.isErrorDeletingGeneratedImagesFlow,
        deleteGeneratedImagesAction = AiutaDataProviderListener::deleteGeneratedImage,
        // Uploaded images
        uploadedImagesFlow = AiutaDataProviderHandler.uploadedImagesFlow,
        addUploadedImagesAction = AiutaDataProviderListener::addUploadedImage,
        isErrorDeletingUploadedImagesFlow = AiutaErrorListener.isErrorDeletingUploadedImagesFlow,
        deleteUploadedImagesAction = AiutaDataProviderListener::deleteUploadedImage,
        selectUploadedImageAction = AiutaDataProviderListener::selectUploadedImage,
    )
}