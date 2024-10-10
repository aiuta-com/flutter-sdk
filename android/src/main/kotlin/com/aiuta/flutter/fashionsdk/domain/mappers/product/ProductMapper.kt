package com.aiuta.flutter.fashionsdk.domain.mappers.product

import com.aiuta.fashionsdk.tryon.compose.domain.models.SKUItem
import com.aiuta.flutter.fashionsdk.domain.models.product.PlatformAiutaProduct

fun PlatformAiutaProduct.toSKUItem(): SKUItem {
    return SKUItem(
        skuId = this.skuId,
        catalogName = this.catalogName,
        description = this.description,
        imageUrls = this.imageUrls,
        localizedPrice = this.localizedPrice,
        localizedOldPrice = this.localizedOldPrice,
        store = this.store,
        generateMoreSKU = this.generateMoreSKU?.map { it.toSKUItem() },
        additionalShareInfo = this.additionalShareInfo,
        inWishlist = this.inWishlist
    )
}