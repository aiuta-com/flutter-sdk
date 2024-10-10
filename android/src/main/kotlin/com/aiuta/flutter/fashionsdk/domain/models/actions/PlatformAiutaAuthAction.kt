package com.aiuta.flutter.fashionsdk.domain.models.actions

import com.aiuta.flutter.fashionsdk.domain.listeners.auth.AiutaJWTAuthenticationListener
import kotlinx.serialization.ExperimentalSerializationApi
import kotlinx.serialization.SerialName
import kotlinx.serialization.Serializable
import kotlinx.serialization.json.JsonClassDiscriminator

@OptIn(ExperimentalSerializationApi::class)
@Serializable
@JsonClassDiscriminator("type")
sealed interface PlatformAiutaAuthAction

@Serializable
@SerialName(AiutaJWTAuthenticationListener.ACTION_REQUEST_JWT)
class PlatformRequestJWTAction(
    @SerialName("params")
    val params: String? = null
): PlatformAiutaAuthAction