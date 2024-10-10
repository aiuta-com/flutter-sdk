package com.aiuta.flutter.fashionsdk.domain.models.actions

import com.aiuta.flutter.fashionsdk.domain.listeners.actions.AiutaActionsListener
import com.aiuta.flutter.fashionsdk.domain.models.product.PlatformAiutaProduct
import kotlinx.serialization.ExperimentalSerializationApi
import kotlinx.serialization.SerialName
import kotlinx.serialization.Serializable
import kotlinx.serialization.json.JsonClassDiscriminator

@OptIn(ExperimentalSerializationApi::class)
@Serializable
@JsonClassDiscriminator("type")
sealed interface PlatformAiutaAction

@Serializable
@SerialName(AiutaActionsListener.ADD_TO_WISHLIST_CLICK)
class PlatformAddToWishListAction(
    @SerialName("product")
    val product: PlatformAiutaProduct
): PlatformAiutaAction

@Serializable
@SerialName(AiutaActionsListener.ADD_TO_CART_CLICK)
class PlatformAddToCartAction(
    @SerialName("product")
    val product: PlatformAiutaProduct
): PlatformAiutaAction