package com.aiuta.flutter.fashionsdk.domain.aiuta

import com.aiuta.fashionsdk.Aiuta
import com.aiuta.fashionsdk.authentication.ApiKeyAuthenticationStrategy
import com.aiuta.fashionsdk.authentication.JWTAuthenticationStrategy
import com.aiuta.flutter.fashionsdk.domain.models.configuration.PlatformAiutaConfiguration
import com.aiuta.flutter.fashionsdk.domain.models.configuration.auth.PlatformApiKeyAuthentication
import com.aiuta.flutter.fashionsdk.domain.models.configuration.auth.PlatformJWTAuthentication

object AiutaHolder {

    private var aiuta: Aiuta? = null

    fun setAiuta(
        aiutaBuilder: Aiuta.Builder,
        platformAiutaConfiguration: PlatformAiutaConfiguration
    ) {
        val platformAuth = platformAiutaConfiguration.authentication

        // Set auth
        aiuta = when (platformAuth) {
            is PlatformApiKeyAuthentication -> {
                aiutaBuilder
                    .setAuthenticationStrategy(ApiKeyAuthenticationStrategy(platformAuth.apiKey))
                    .setSubscriptionId(platformAuth.subscriptionId)
            }

            is PlatformJWTAuthentication -> {
                aiutaBuilder
                    .setAuthenticationStrategy(JWTAuthenticationStrategy(
                        getJWT = { params ->
                            // TODO
                            ""
                        }
                    ))
                    .setSubscriptionId(platformAuth.subscriptionId)
            }
        }.build()
    }

    fun getAiuta(): Aiuta {
        return checkNotNull(aiuta) {
            "AiutaHolder: aiuta is not init, please call setAiuta()"
        }
    }
}