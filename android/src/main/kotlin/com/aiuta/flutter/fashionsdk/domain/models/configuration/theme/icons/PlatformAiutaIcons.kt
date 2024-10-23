package com.aiuta.flutter.fashionsdk.domain.models.configuration.theme.icons

import kotlinx.serialization.SerialName
import kotlinx.serialization.Serializable

@Serializable
class PlatformAiutaIcons(
    // x100
    @SerialName("recent100")
    val recent100: PlatformAiutaIcon,

    // x82
    @SerialName("welcomeScreen82")
    val welcomeScreen82: PlatformAiutaIcon,

    // x36
    @SerialName("error36")
    val error36: PlatformAiutaIcon,

    @SerialName("like36")
    val like36: PlatformAiutaIcon,

    @SerialName("dislike36")
    val dislike36: PlatformAiutaIcon,

    // x24
    @SerialName("back24")
    val back24: PlatformAiutaIcon,

    @SerialName("camera24")
    val camera24: PlatformAiutaIcon,

    @SerialName("checkCorrect24")
    val checkCorrect24: PlatformAiutaIcon,

    @SerialName("checkNotCorrect24")
    val checkNotCorrect24: PlatformAiutaIcon,

    @SerialName("close24")
    val close24: PlatformAiutaIcon,

    @SerialName("trash24")
    val trash24: PlatformAiutaIcon,

    @SerialName("takePhoto24")
    val takePhoto24: PlatformAiutaIcon,

    @SerialName("history24")
    val history24: PlatformAiutaIcon,

    @SerialName("photoLibrary24")
    val photoLibrary24: PlatformAiutaIcon,

    @SerialName("share24")
    val share24: PlatformAiutaIcon,

    @SerialName("wishlist24")
    val wishlist24: PlatformAiutaIcon,

    @SerialName("wishlistFill24")
    val wishlistFill24: PlatformAiutaIcon,

    @SerialName("info20")
    val info20: PlatformAiutaIcon,

    // x16
    @SerialName("check16")
    val check16: PlatformAiutaIcon,

    @SerialName("magic16")
    val magic16: PlatformAiutaIcon,

    @SerialName("lock16")
    val lock16: PlatformAiutaIcon,

    @SerialName("arrow16")
    val arrow16: PlatformAiutaIcon,

    // x14
    @SerialName("loading14")
    val loading14: PlatformAiutaIcon,
)