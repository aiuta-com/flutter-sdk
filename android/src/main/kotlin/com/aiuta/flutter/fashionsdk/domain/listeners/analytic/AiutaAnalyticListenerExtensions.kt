package com.aiuta.flutter.fashionsdk.domain.listeners.analytic

import com.aiuta.fashionsdk.analytic.events.AnalyticEvent
import com.aiuta.flutter.fashionsdk.domain.mappers.analytic.toPlatformAnalyticEvent
import kotlinx.serialization.encodeToString
import kotlinx.serialization.json.Json

fun AiutaAnalyticListener.sendAnalytic(event: AnalyticEvent) {
    val platformEvent = event.toPlatformAnalyticEvent()
    sendEvent(Json.encodeToString(platformEvent))
}