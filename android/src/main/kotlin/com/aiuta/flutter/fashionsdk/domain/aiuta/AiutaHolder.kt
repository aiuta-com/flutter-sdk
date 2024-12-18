package com.aiuta.flutter.fashionsdk.domain.aiuta

import com.aiuta.fashionsdk.Aiuta
import com.aiuta.fashionsdk.authentication.ApiKeyAuthenticationStrategy
import com.aiuta.fashionsdk.authentication.JWTAuthenticationStrategy
import com.aiuta.flutter.fashionsdk.domain.listeners.auth.AiutaJWTAuthenticationListener
import com.aiuta.flutter.fashionsdk.domain.listeners.auth.requestJWT
import com.aiuta.flutter.fashionsdk.domain.models.configuration.PlatformAiutaConfiguration
import com.aiuta.flutter.fashionsdk.domain.models.configuration.auth.PlatformApiKeyAuthentication
import com.aiuta.flutter.fashionsdk.domain.models.configuration.auth.PlatformJWTAuthentication
import kotlinx.coroutines.flow.Flow
import kotlinx.coroutines.flow.MutableStateFlow
import kotlinx.coroutines.flow.filterNotNull
import kotlinx.coroutines.flow.first

object AiutaHolder {

    private var aiuta: Aiuta? = null

    private val _jwtFlow: MutableStateFlow<String?> = MutableStateFlow(null)
    private val jwtFlow: Flow<String> = _jwtFlow.filterNotNull()

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
                            AiutaJWTAuthenticationListener.requestJWT(params)

                            // Await
                            jwtFlow.first().also {
                                // Clean flow
                                _jwtFlow.value = null
                            }
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

    fun resolveJWT(newJWT: String) {
        _jwtFlow.value = newJWT
    }
}