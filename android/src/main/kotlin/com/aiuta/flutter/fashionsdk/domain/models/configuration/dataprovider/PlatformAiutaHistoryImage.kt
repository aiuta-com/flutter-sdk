package com.aiuta.flutter.fashionsdk.domain.models.configuration.dataprovider

import kotlinx.serialization.ExperimentalSerializationApi
import kotlinx.serialization.SerialName
import kotlinx.serialization.Serializable
import kotlinx.serialization.json.JsonClassDiscriminator

@Serializable
public class PlatformAiutaUploadedImage(
    @SerialName("id")
    public val id: String,

    @SerialName("url")
    public val url: String
)

@Serializable
public class PlatformAiutaGeneratedImage(
    @SerialName("url")
    public val url: String
)