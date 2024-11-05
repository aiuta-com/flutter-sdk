package com.aiuta.flutter.fashionsdk.domain.listeners.error

import com.aiuta.flutter.fashionsdk.domain.models.error.PlatformAiutaError
import com.aiuta.flutter.fashionsdk.utils.json
import kotlinx.coroutines.CoroutineScope
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.SupervisorJob
import kotlinx.coroutines.flow.MutableSharedFlow
import kotlinx.coroutines.flow.SharedFlow
import kotlinx.coroutines.launch

object AiutaErrorListener {
    private val scope = CoroutineScope(Dispatchers.IO + SupervisorJob())

    private val _isErrorDeletingGeneratedImagesFlow: MutableSharedFlow<Boolean> =
        MutableSharedFlow(replay = 1)
    val isErrorDeletingGeneratedImagesFlow: SharedFlow<Boolean> =
        _isErrorDeletingGeneratedImagesFlow

    private val _isErrorDeletingUploadedImagesFlow: MutableSharedFlow<Boolean> =
        MutableSharedFlow(replay = 1)
    val isErrorDeletingUploadedImagesFlow: SharedFlow<Boolean> = _isErrorDeletingUploadedImagesFlow


    fun notifyAboutError(rawError: String) {
        scope.launch {
            val platformError = json.decodeFromString<PlatformAiutaError>(rawError)

            when (platformError) {
                PlatformAiutaError.FAILED_DELETE_GENERATED_IMAGES -> {
                    _isErrorDeletingGeneratedImagesFlow.emit(true)
                }

                PlatformAiutaError.FAILED_DELETE_UPLOADED_IMAGES -> {
                    _isErrorDeletingUploadedImagesFlow.emit(true)
                }
            }
        }
    }


    // Argument keys
    const val ERROR_TYPE_ARGUMENT = "error"
}