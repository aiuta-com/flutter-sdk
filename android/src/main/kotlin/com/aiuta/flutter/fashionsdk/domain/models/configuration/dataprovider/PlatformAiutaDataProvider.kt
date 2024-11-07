package com.aiuta.flutter.fashionsdk.domain.models.configuration.dataprovider

import kotlinx.serialization.SerialName
import kotlinx.serialization.Serializable

@Serializable
public class PlatformAiutaDataProvider(
    @SerialName("isUserConsentObtained")
    public val isUserConsentObtained: Boolean,

    @SerialName("uploadedImages")
    public val uploadedImages: List<PlatformAiutaHistoryImage>? = null,

    @SerialName("generatedImages")
    public val generatedImages: List<PlatformAiutaHistoryImage>? = null
)