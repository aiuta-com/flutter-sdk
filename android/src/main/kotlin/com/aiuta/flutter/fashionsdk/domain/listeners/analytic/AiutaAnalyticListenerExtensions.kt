package com.aiuta.flutter.fashionsdk.domain.listeners.analytic

import com.aiuta.fashionsdk.internal.analytic.model.ExternalAnalyticEvent

fun AiutaAnalyticListener.sendAnalytic(event: ExternalAnalyticEvent) {
    sendEvent(event.serialize())
}