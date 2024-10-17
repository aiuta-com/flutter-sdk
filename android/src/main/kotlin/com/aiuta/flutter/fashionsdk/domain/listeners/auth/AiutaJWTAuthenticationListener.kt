package com.aiuta.flutter.fashionsdk.domain.listeners.auth

import com.aiuta.flutter.fashionsdk.domain.listeners.base.BaseListener

object AiutaJWTAuthenticationListener : BaseListener() {

    // Channel key
    override val keyChannel: String = "aiutaJWTAuthHandler"

    // All possible actions
    const val ACTION_REQUEST_JWT = "requestJWT"
}