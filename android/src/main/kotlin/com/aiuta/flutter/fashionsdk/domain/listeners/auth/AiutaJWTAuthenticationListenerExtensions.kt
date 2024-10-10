package com.aiuta.flutter.fashionsdk.domain.listeners.auth

import com.aiuta.flutter.fashionsdk.domain.models.actions.PlatformAiutaAuthAction
import com.aiuta.flutter.fashionsdk.domain.models.actions.PlatformRequestJWTAction
import kotlinx.serialization.encodeToString
import kotlinx.serialization.json.Json

fun AiutaJWTAuthenticationListener.requestJWT(params: String?) {
    val action = PlatformRequestJWTAction(params = params)
    sendEvent(Json.encodeToString<PlatformAiutaAuthAction>(action))
}