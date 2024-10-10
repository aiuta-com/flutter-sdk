package com.aiuta.flutter.fashionsdk

import android.app.Application
import com.aiuta.fashionsdk.Aiuta

class AiutaApplication: Application() {

    override fun onCreate() {
        super.onCreate()
        initFashionBuilder()
    }

    private fun initFashionBuilder() {
        aiutaBuilder = Aiuta.Builder().setApplication(this)
    }

    companion object {
        lateinit var aiutaBuilder: Aiuta.Builder
    }
}