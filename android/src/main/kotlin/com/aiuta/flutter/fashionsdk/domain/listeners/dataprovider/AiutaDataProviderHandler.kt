package com.aiuta.flutter.fashionsdk.domain.listeners.dataprovider

import com.aiuta.fashionsdk.tryon.compose.domain.models.dataprovider.AiutaGeneratedImage
import com.aiuta.fashionsdk.tryon.compose.domain.models.dataprovider.AiutaUploadedImage
import com.aiuta.flutter.fashionsdk.domain.mappers.configuration.dataprovider.toAiutaUploadedImage
import com.aiuta.flutter.fashionsdk.domain.models.configuration.dataprovider.PlatformAiutaGeneratedImage
import com.aiuta.flutter.fashionsdk.domain.models.configuration.dataprovider.PlatformAiutaUploadedImage
import com.aiuta.flutter.fashionsdk.utils.json
import kotlinx.coroutines.flow.MutableStateFlow
import kotlinx.coroutines.flow.StateFlow

object AiutaDataProviderHandler {

    private val _isUserConsentObtainedFlow: MutableStateFlow<Boolean> = MutableStateFlow(false)
    val isUserConsentObtainedFlow: StateFlow<Boolean> = _isUserConsentObtainedFlow

    private val _uploadedImagesFlow: MutableStateFlow<List<AiutaUploadedImage>> = MutableStateFlow(
        emptyList()
    )
    val uploadedImagesFlow: StateFlow<List<AiutaUploadedImage>> = _uploadedImagesFlow

    private val _generatedImagesFlow: MutableStateFlow<List<AiutaGeneratedImage>> =
        MutableStateFlow(
            emptyList()
        )
    val generatedImagesFlow: StateFlow<List<AiutaGeneratedImage>> = _generatedImagesFlow

    fun updateIsUserConsentObtained(isUserConsentObtained: Boolean) {
        _isUserConsentObtainedFlow.value = isUserConsentObtained
    }

    fun updateUploadedImages(rawUploadedImages: String) {
        val uploadedImages: List<PlatformAiutaUploadedImage> =
            json.decodeFromString(rawUploadedImages)
        _uploadedImagesFlow.value = uploadedImages.map { it.toAiutaUploadedImage() }
    }

    fun updateGeneratedImages(rawGeneratedImages: String) {
        val generatedImages: List<PlatformAiutaGeneratedImage> =
            json.decodeFromString(rawGeneratedImages)
        _generatedImagesFlow.value = generatedImages.map { it.toAiutaUploadedImage() }
    }
}