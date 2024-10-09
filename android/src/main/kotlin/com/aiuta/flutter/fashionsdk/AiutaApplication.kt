package com.aiuta.flutter.fashionsdk

import android.app.Application
import com.aiuta.fashionsdk.Aiuta
import com.aiuta.fashionsdk.authentication.ApiKeyAuthenticationStrategy

class AiutaApplication: Application() {
    override fun onCreate() {
        super.onCreate()
        initFashion()
    }

    private fun initFashion() {
        aiuta =
            Aiuta.Builder()
                .setAuthenticationStrategy(
                    authenticationStrategy = ApiKeyAuthenticationStrategy(
                        apiKey = API_KEY
                    )
                )
                .setSubscriptionId(SUBSCRIPTION_ID)
                .setApplication(this)
                .build()
    }

    companion object {
        lateinit var aiuta: Aiuta

        const val API_KEY = "HEPSI2024" // TODO
        const val SUBSCRIPTION_ID = "YOUR_SUBSCRIPTION_ID_HERE"
    }
}