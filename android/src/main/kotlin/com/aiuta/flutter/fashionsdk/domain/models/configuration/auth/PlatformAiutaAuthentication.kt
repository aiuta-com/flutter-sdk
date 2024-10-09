package com.aiuta.flutter.fashionsdk.domain.models.configuration.auth

import kotlinx.serialization.ExperimentalSerializationApi
import kotlinx.serialization.SerialName
import kotlinx.serialization.Serializable
import kotlinx.serialization.json.JsonClassDiscriminator

@OptIn(ExperimentalSerializationApi::class)
@Serializable
@JsonClassDiscriminator("mode")
sealed interface PlatformAiutaAuthentication {

    companion object {
        const val TYPE_JWT = "jwt"
        const val TYPE_API_KEY = "apiKey"
    }
}

@Serializable
@SerialName(PlatformAiutaAuthentication.TYPE_API_KEY)
class PlatformApiKeyAuthentication(
    @SerialName("subscriptionId")
    val subscriptionId: String,
    @SerialName("apiKey")
    val apiKey: String
) : PlatformAiutaAuthentication

@Serializable
@SerialName(PlatformAiutaAuthentication.TYPE_JWT)
class PlatformJWTAuthentication(
    @SerialName("subscriptionId")
    val subscriptionId: String,
) : PlatformAiutaAuthentication