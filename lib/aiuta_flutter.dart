import 'dart:convert';

import 'package:aiuta_flutter/configuration/aiuta_configuration.dart';
import 'package:aiuta_flutter/configuration/auth/aiuta_authentication.dart';
import 'package:aiuta_flutter/models/actions/aiuta_action.dart';
import 'package:aiuta_flutter/models/actions/aiuta_auth_action.dart';
import 'package:aiuta_flutter/models/analytic/aiuta_analytic_event.dart';
import 'package:aiuta_flutter/models/exceptions/not_valid_auth_exception.dart';
import 'package:aiuta_flutter/models/product/aiuta_product.dart';
import 'package:aiuta_flutter/platform/aiutasdk_platform_interface.dart';

class Aiuta {
  AiutaConfiguration configuration;

  Aiuta({required this.configuration}) {
    _observeAiutaActions();
    _observeAiutaJWTAuthActions();
  }

  Future<void> startTryonFlow({required AiutaProduct product}) {
    return AiutaPlatform.instance.startAiutaFlow(
      product: product,
      configuration: configuration,
    );
  }

  Stream<AiutaAnalyticEvent> observeAiutaAnalytic() {
    return AiutaPlatform.instance.observeAiutaAnalytic().map((event) {
      var rawEvent = jsonDecode(event) as Map<String, dynamic>;
      return AiutaAnalyticEvent.fromJson(rawEvent);
    });
  }

  // Internals
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
}
