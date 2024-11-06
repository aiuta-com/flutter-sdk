package com.aiuta.flutter.fashionsdk.domain.models.product

import kotlinx.serialization.SerialName
import kotlinx.serialization.Serializable

@Serializable
class PlatformAiutaProduct(
    @SerialName("skuId")
    val skuId: String,

    @SerialName("catalogName")
    val catalogName: String? = null,

    @SerialName("title")
    val title: String,

    @SerialName("imageUrls")
    val imageUrls: List<String>,

    @SerialName("localizedPrice")
    val localizedPrice: String? = null,

    @SerialName("localizedOldPrice")
    val localizedOldPrice: String? = null,

    @SerialName("brand")
    val brand: String,

    @SerialName("additionalShareInfo")
    val additionalShareInfo: String? = null,

    @SerialName("inWishlist")
    val inWishlist: Boolean
)