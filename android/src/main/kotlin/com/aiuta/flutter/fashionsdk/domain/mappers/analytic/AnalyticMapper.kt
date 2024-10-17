package com.aiuta.flutter.fashionsdk.domain.mappers.analytic

import com.aiuta.fashionsdk.analytic.events.AnalyticEvent
import com.aiuta.flutter.fashionsdk.domain.models.analytic.PlatformAnalyticEvent

fun AnalyticEvent.toPlatformAnalyticEvent(): PlatformAnalyticEvent {
    return PlatformAnalyticEvent(
        name = name,
        params = params
    )
}