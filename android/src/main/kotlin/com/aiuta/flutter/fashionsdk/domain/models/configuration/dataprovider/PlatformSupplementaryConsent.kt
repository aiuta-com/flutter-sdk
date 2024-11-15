package com.aiuta.flutter.fashionsdk.domain.models.configuration.dataprovider

import kotlinx.serialization.SerialName
import kotlinx.serialization.Serializable

@Serializable
class PlatformSupplementaryConsent(
    @SerialName("consentText")
    public val consentText: String,
    @SerialName("isObtained")
    public val isObtained: Boolean,
)