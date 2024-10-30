import 'package:aiuta_flutter/aiuta_flutter.dart';
import 'package:aiuta_flutter/configuration/aiuta_configuration.dart';
import 'package:aiuta_flutter/configuration/auth/aiuta_authentication.dart';
import 'package:aiuta_flutter/configuration/language/aiuta_language.dart';
import 'package:aiuta_flutter/configuration/language/default_aiuta_languages.dart';
import 'package:aiuta_flutter/configuration/listeners/aiuta_listeners.dart';
import 'package:aiuta_flutter/configuration/mode/aiuta_mode.dart';
import 'package:aiuta_flutter/configuration/theme/aiuta_theme.dart';
import 'package:aiuta_flutter/configuration/theme/colors/aiuta_colors.dart';
import 'package:aiuta_flutter/configuration/theme/dimensions/aiuta_dimensions.dart';
import 'package:aiuta_flutter/configuration/theme/gradients/aiuta_gradients.dart';
import 'package:aiuta_flutter/configuration/theme/toggles/aiuta_theme_toggles.dart';
import 'package:aiuta_flutter/configuration/toggles/aiuta_toggles.dart';
import 'package:aiuta_flutter/models/product/aiuta_product.dart';
import 'package:aiutasdk_example/env/env.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _aiuta = Aiuta(
    configuration: AiutaConfiguration(
      mode: AiutaMode.fullScreen,
      authentication: ApiKeyAuthentication(
        subscriptionId: Env.SUBSCRIPTION_ID,
        apiKey: Env.API_KEY,
      ),
      toggles: AiutaToggles(
        isHistoryAvailable: true,
        isWishlistAvailable: true,
        isPreOnboardingAvailable: false,
        isShareAvailable: false,
      ),
      language: StandardLanguage(
        language: DefaultAiutaLanguages.english,
        brand: "YOUR Brand",
        termsOfServiceUrl: "https://brand.com/tos",
        privacyPolicyUrl: "https://brand.com/pp",
      ),
      listeners: AiutaListeners(
        addToWishlistClick: (skuItem) async {
          debugPrint("addToWishlistClick ${skuItem.skuId}");
          // Do update staff
          return AiutaProduct(
            skuId: skuItem.skuId,
            catalogName: skuItem.catalogName,
            title: skuItem.title,
            imageUrls: skuItem.imageUrls,
            brand: skuItem.brand,
            inWishlist: !skuItem.inWishlist,
          );
        },
        addToCartClick: (skuItem) async {
          debugPrint("addToCartClick ${skuItem.skuId}");
        },
      ),
      theme: AiutaTheme(
        colors: AiutaColors(
          primary: "#FF000000",
          secondary: "#FF9F9F9F",
          tertiary: "#FFEEEEEE",
          onDark: "#FFFFFFFF",
          onError: "#FF000000",
          brand: "#FF000000",
          accent: "#FFFB1010",
          error: "#FFFFF5F5",
          aiuta: "#FF4000FF",
          background: "#FFFFFFFF",
          neutral: "#FFF2F2F7",
          neutral2: "#FFE5E5EA",
          neutral3: "#FFC7C7CC",
        ),
        gradients: AiutaGradients(
          loadingAnimation: ["#FF000000", "#00000000"],
        ),
        dimensions: AiutaDimensions(
          grabberPaddingTop: 16,
          grabberWidth: 16,
        ),
        toggles: AiutaThemeToggles(
          isOnboardingAppBarExtended: true,
          isMainAppbarReversed: true,
          isShadowsReduced: true,
          isDelimitersExtended: true,
          isProductFirstImageExtendedPaddingApplied: true,
          isBlurOutlinesEnabled: true,
        ),
      ),
      onAnalyticsEvent: (event) async {
        debugPrint("analytic event - ${event} ${event.toJson()}");
      },
    ),
  );

  bool _isAiutaAvailable = false;

  @override
  void initState() {
    super.initState();
    _aiuta.isAvailable.then((isAvailable) {
      setState(() {
        _isAiutaAvailable = isAvailable;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Aiuta SDK example app'),
        ),
        body: Center(
          child: _isAiutaAvailable
              ? Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextButton(
                      style: ButtonStyle(
                        foregroundColor:
                            MaterialStateProperty.all<Color>(Colors.blue),
                        textStyle: MaterialStateProperty.all<TextStyle>(
                            const TextStyle(fontSize: 20)),
                      ),
                      onPressed: () {
                        _aiuta.startTryonFlow(
                          product: AiutaProduct(
                            skuId: Env.SKU_ID,
                            catalogName: Env.SKU_CATALOG_NAME,
                            title: "YOUR title",
                            imageUrls: [
                              "YOUR image 1",
                              "YOUR image 2",
                            ],
                            brand: "YOUR brand",
                            inWishlist: true,
                          ),
                        );
                      },
                      child: const Text('Start Aiuta'),
                    ),
                    TextButton(
                      style: ButtonStyle(
                        foregroundColor:
                            MaterialStateProperty.all<Color>(Colors.blue),
                        textStyle: MaterialStateProperty.all<TextStyle>(
                            const TextStyle(fontSize: 20)),
                      ),
                      onPressed: () {
                        _aiuta.startHistoryFlow();
                      },
                      child: const Text('Show history'),
                    ),
                  ],
                )
              : const Text('Aiuta is not available'),
        ),
      ),
    );
  }
}
