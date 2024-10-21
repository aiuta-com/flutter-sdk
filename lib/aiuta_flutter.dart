import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:aiuta_flutter/configuration/aiuta_configuration.dart';
import 'package:aiuta_flutter/configuration/auth/aiuta_authentication.dart';
import 'package:aiuta_flutter/src/models/actions/aiuta_action.dart';
import 'package:aiuta_flutter/src/models/actions/aiuta_auth_action.dart';
import 'package:aiuta_flutter/models/analytic/aiuta_analytic_event.dart';
import 'package:aiuta_flutter/src/models/actions/aiuta_data_action.dart';
import 'package:aiuta_flutter/models/exceptions/not_valid_auth_exception.dart';
import 'package:aiuta_flutter/models/product/aiuta_product.dart';
import 'package:aiuta_flutter/src/platform/aiutasdk_platform_interface.dart';

/// Aiuta is the main class that provides the public API for the Aiuta SDK.
/// To use Aiuta, you need to create an instance of Aiuta and provide a [configuration].
class Aiuta {
  /// The configuration object that is used to configure the Aiuta SDK.
  final AiutaConfiguration configuration;

  final Completer<bool> _isAvailableCompleter = new Completer();

  /// Create a new instance of Aiuta.
  /// [configuration] is required to configure the Aiuta SDK.
  Aiuta({required this.configuration}) {
    _observeAiutaActions();
    _observeAiutaJWTAuthActions();
    _observeAiutaAnalytic();
    _observeAiutaDataActions();
    _configureAndSetAvailability();
    _listenDataProviderChanges();
  }

  /// Returns a future that completes with a boolean value indicating whether the Aiuta SDK is available.
  Future<bool> get isAvailable => _isAvailableCompleter.future;

  /// Starts the virtual try-on flow with the given [product].
  Future<void> startTryonFlow({required AiutaProduct product}) {
    return AiutaPlatform.instance.startAiutaFlow(
      product: product,
      configuration: configuration,
    );
  }

  /// Provide the user with a history of their virtual try-on generations.
  Future<void> startHistoryFlow() {
    return AiutaPlatform.instance.startHistoryFlow(
      configuration: configuration,
    );
  }

  // Internals
  void _configureAndSetAvailability() {
    if (Platform.isAndroid) {
      _isAvailableCompleter.complete(true);
    } else if (Platform.isIOS) {
      AiutaPlatform.instance.configure(configuration: configuration).then((_) {
        _isAvailableCompleter.complete(true);
      }).catchError((error) {
        print("Aiuta ${error.toString()}");
        _isAvailableCompleter.complete(false);
      });
    } else {
      _isAvailableCompleter.complete(false);
    }
  }

  void _observeAiutaAnalytic() {
    if (configuration.onAnalyticsEvent == null) {
      return;
    }

    AiutaPlatform.instance.observeAiutaAnalytic().map((event) {
      var rawEvent = jsonDecode(event) as Map<String, dynamic>;
      return AiutaAnalyticEvent.fromJson(rawEvent);
    }).listen((event) async {
      configuration.onAnalyticsEvent!(event);
    });
  }

  void _observeAiutaActions() {
    AiutaPlatform.instance.observeAiutaActions().listen(
      (value) async {
        var rawAction = jsonDecode(value) as Map<String, dynamic>;
        var action = AiutaAction.fromJson(rawAction);

        switch (action) {
          case AddToWishlistAction():
            var updatedProduct = await configuration.listeners
                .addToWishlistClick(action.product);
            AiutaPlatform.instance.updateActiveAiutaProduct(
              updatedAiutaProduct: updatedProduct,
            );
            break;
          case AddToCartAction():
            configuration.listeners.addToCartClick(action.product);
            break;
        }
      },
    );
  }

  void _observeAiutaJWTAuthActions() {
    AiutaPlatform.instance.observeAiutaJWTAuthActions().listen(
      (value) async {
        var rawAuthAction = jsonDecode(value) as Map<String, dynamic>;
        var authAction = AiutaAuthAction.fromJson(rawAuthAction);

        switch (authAction) {
          case RequestJWTAction():
            var authentication = configuration.authentication;

            if (authentication is JWTAuthentication) {
              var jwt = await authentication.getJWT(authAction.params);
              AiutaPlatform.instance.resolveJWTAuth(
                newJWT: jwt,
              );
            } else {
              throw NotValidAuthenticationException(
                "Native tried to get JWT, while flutter get different type of auth",
              );
            }

            break;
        }
      },
    );
  }

  void _observeAiutaDataActions() {
    var listeners = configuration.dataProvider?.listeners;
    if (listeners == null) {
      return;
    }

    AiutaPlatform.instance.observeAiutaDataActions().listen(
      (value) async {
        var rawAction = jsonDecode(value) as Map<String, dynamic>;
        var action = AiutaDataAction.fromJson(rawAction);
        switch (action) {
          case ObtainUserConsentAction():
            listeners.obtainUserConsent();
          case AddUploadedImagesAction():
            listeners.addUploadedImages(action.uploadedImages);
            break;
          case SelectUploadedImageAction():
            listeners.selectUploadedImage(action.uploadedImage);
            break;
          case DeleteUploadedImagesAction():
            listeners.deleteUploadedImages(action.uploadedImages);
            break;
          case AddGeneratedImagesAction():
            listeners.addGeneratedImages(action.generatedImages);
            break;
          case DeleteGeneratedImagesAction():
            listeners.deleteGeneratedImages(action.generatedImages);
            break;
        }
      },
    );
  }

  void _listenDataProviderChanges() {
    var dataProvider = configuration.dataProvider;
    if (dataProvider == null) {
      return;
    }

    dataProvider.isUserConsentObtained.addListener(() {
      AiutaPlatform.instance.updateUserConsent(
          isUserConsentObtained: dataProvider.isUserConsentObtained.value);
    });

    dataProvider.uploadedImages.addListener(() {
      AiutaPlatform.instance.updateUploadedImages(
          uploadedImages: dataProvider.uploadedImages.value);
    });

    dataProvider.generatedImages.addListener(() {
      AiutaPlatform.instance.updateGeneratedImages(
          generatedImages: dataProvider.generatedImages.value);
    });
  }
}
