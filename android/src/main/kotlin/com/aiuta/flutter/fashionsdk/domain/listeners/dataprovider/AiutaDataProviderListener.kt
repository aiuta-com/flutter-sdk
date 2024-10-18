package com.aiuta.flutter.fashionsdk.domain.listeners.dataprovider

import com.aiuta.flutter.fashionsdk.domain.listeners.base.BaseListener

object AiutaDataProviderListener : BaseListener() {
    override val keyChannel: String = "aiutaDataActionsHandler"

    // All possible keys (input)
    const val IS_USER_CONSENT_OBTAINED_KEY = "isUserConsentObtained"
    const val UPLOADED_IMAGES_KEY = "uploadedImages"
    const val GENERATED_IMAGES_KEY = "generatedImages"


    // All possible actions (output)
    const val OBTAIN_USER_CONSENT_ACTION = "obtainUserConsent"
    const val ADD_UPLOADED_IMAGE_ACTION = "addUploadedImage"
    const val SELECT_UPLOADED_IMAGE_ACTION = "selectUploadedImage"
    const val DELETE_UPLOADED_IMAGE_ACTION = "deleteUploadedImage"
    const val ADD_GENERATED_IMAGE_ACTION = "addGeneratedImage"
    const val DELETE_GENERATED_IMAGE_ACTION = "deleteGeneratedImage"
}