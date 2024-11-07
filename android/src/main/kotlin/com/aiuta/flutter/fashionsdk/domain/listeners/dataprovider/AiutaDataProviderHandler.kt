package com.aiuta.flutter.fashionsdk.domain.listeners.dataprovider

import com.aiuta.fashionsdk.tryon.compose.domain.models.dataprovider.AiutaHistoryImage
import com.aiuta.flutter.fashionsdk.domain.mappers.configuration.dataprovider.toNative
import com.aiuta.flutter.fashionsdk.domain.models.configuration.dataprovider.PlatformAiutaHistoryImage
import com.aiuta.flutter.fashionsdk.utils.json
import kotlinx.coroutines.flow.MutableStateFlow
import kotlinx.coroutines.flow.StateFlow

object AiutaDataProviderHandler {

    private val _isUserConsentObtainedFlow: MutableStateFlow<Boolean> = MutableStateFlow(false)
    val isUserConsentObtainedFlow: StateFlow<Boolean> = _isUserConsentObtainedFlow

    private val _uploadedImagesFlow: MutableStateFlow<List<AiutaHistoryImage>> = MutableStateFlow(
        emptyList()
    )
    val uploadedImagesFlow: StateFlow<List<AiutaHistoryImage>> = _uploadedImagesFlow

    private val _generatedImagesFlow: MutableStateFlow<List<AiutaHistoryImage>> =
        MutableStateFlow(
            emptyList()
        )
    val generatedImagesFlow: StateFlow<List<AiutaHistoryImage>> = _generatedImagesFlow

    fun updateIsUserConsentObtained(isUserConsentObtained: Boolean) {
        _isUserConsentObtainedFlow.value = isUserConsentObtained
    }

    // Uploaded images
    fun updateUploadedImages(rawUploadedImages: String) {
        val uploadedImages: List<PlatformAiutaHistoryImage> = json.decodeFromString(
            string = rawUploadedImages
        )
        updateUploadedImages(uploadedImages)
    }

    fun updateUploadedImages(uploadedImages: List<PlatformAiutaHistoryImage>) {
        _uploadedImagesFlow.value = uploadedImages.map { it.toNative() }
    }

    // Generated images
    fun updateGeneratedImages(rawGeneratedImages: String) {
        val generatedImages: List<PlatformAiutaHistoryImage> = json.decodeFromString(
            string = rawGeneratedImages
        )
        updateGeneratedImages(generatedImages)
    }

    fun updateGeneratedImages(generatedImages: List<PlatformAiutaHistoryImage>) {
        _generatedImagesFlow.value = generatedImages.map { it.toNative() }
    }
}