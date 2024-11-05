package com.aiuta.flutter.fashionsdk.domain.models.error

import kotlinx.serialization.SerialName
import kotlinx.serialization.Serializable

@Serializable
enum class PlatformAiutaError {
    @SerialName("failedDeleteUploadedImages")
    FAILED_DELETE_UPLOADED_IMAGES,

    @SerialName("failedDeleteGeneratedImages")
    FAILED_DELETE_GENERATED_IMAGES,
}