package com.aiuta.flutter.fashionsdk.domain.models.actions

import com.aiuta.flutter.fashionsdk.domain.listeners.dataprovider.AiutaDataProviderListener
import com.aiuta.flutter.fashionsdk.domain.models.configuration.dataprovider.PlatformAiutaGeneratedImage
import com.aiuta.flutter.fashionsdk.domain.models.configuration.dataprovider.PlatformAiutaUploadedImage
import kotlinx.serialization.ExperimentalSerializationApi
import kotlinx.serialization.SerialName
import kotlinx.serialization.Serializable
import kotlinx.serialization.json.JsonClassDiscriminator

@OptIn(ExperimentalSerializationApi::class)
@Serializable
@JsonClassDiscriminator("type")
sealed interface PlatformAiutaDataProviderAction

@Serializable
@SerialName(AiutaDataProviderListener.OBTAIN_USER_CONSENT_ACTION)
class PlatformObtainUserConsentAction: PlatformAiutaDataProviderAction

@Serializable
@SerialName(AiutaDataProviderListener.ADD_UPLOADED_IMAGE_ACTION)
class PlatformAddUploadedImageAction(
    @SerialName("uploadedImages")
    val uploadedImages: List<PlatformAiutaUploadedImage>
): PlatformAiutaDataProviderAction

@Serializable
@SerialName(AiutaDataProviderListener.SELECT_UPLOADED_IMAGE_ACTION)
class PlatformSelectUploadedImageAction(
    @SerialName("uploadedImage")
    val uploadedImage: PlatformAiutaUploadedImage
): PlatformAiutaDataProviderAction

@Serializable
@SerialName(AiutaDataProviderListener.DELETE_UPLOADED_IMAGE_ACTION)
class PlatformDeleteUploadedImageAction(
    @SerialName("uploadedImages")
    val uploadedImages: List<PlatformAiutaUploadedImage>
): PlatformAiutaDataProviderAction


@Serializable
@SerialName(AiutaDataProviderListener.ADD_GENERATED_IMAGE_ACTION)
class PlatformAddGeneratedImageAction(
    @SerialName("generatedImages")
    val generatedImages: List<PlatformAiutaGeneratedImage>
): PlatformAiutaDataProviderAction

@Serializable
@SerialName(AiutaDataProviderListener.DELETE_GENERATED_IMAGE_ACTION)
class PlatformDeleteGeneratedImageAction(
    @SerialName("generatedImages")
    val generatedImages: List<PlatformAiutaGeneratedImage>
): PlatformAiutaDataProviderAction