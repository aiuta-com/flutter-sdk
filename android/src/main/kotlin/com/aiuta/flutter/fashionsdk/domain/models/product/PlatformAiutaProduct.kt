package com.aiuta.flutter.fashionsdk.domain.models.product

import kotlinx.serialization.SerialName
import kotlinx.serialization.Serializable

@Serializable
class PlatformAiutaProduct(
    @SerialName("skuId")
    val skuId: String,

    @SerialName("catalogName")
    val catalogName: String? = null,

    @SerialName("description")
    val description: String,

    @SerialName("imageUrls")
    val imageUrls: List<String>,

    @SerialName("localizedPrice")
    val localizedPrice: String,

    @SerialName("localizedOldPrice")
    val localizedOldPrice: String? = null,

    @SerialName("store")
    val store: String,

    @SerialName("generateMoreSKU")
    val generateMoreSKU: List<PlatformAiutaProduct>? = null,

    @SerialName("additionalShareInfo")
    val additionalShareInfo: String? = null,

    @SerialName("inWishlist")
    val inWishlist: Boolean
)