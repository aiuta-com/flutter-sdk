import 'package:aiuta_flutter/aiuta_flutter.dart';
import 'package:aiuta_flutter/configuration/aiuta_configuration.dart';
import 'package:aiuta_flutter/configuration/auth/aiuta_authentication.dart';
import 'package:aiuta_flutter/configuration/dimensions/aiuta_dimensions.dart';
import 'package:aiuta_flutter/configuration/language/aiuta_language.dart';
import 'package:aiuta_flutter/configuration/language/default_aiuta_languages.dart';
import 'package:aiuta_flutter/configuration/listeners/aiuta_listeners.dart';
import 'package:aiuta_flutter/configuration/mode/aiuta_mode.dart';
import 'package:aiuta_flutter/configuration/theme/aiuta_theme.dart';
import 'package:aiuta_flutter/configuration/theme/colors/aiuta_colors.dart';
import 'package:aiuta_flutter/configuration/theme/gradients/aiuta_gradients.dart';
import 'package:aiuta_flutter/configuration/theme/toggles/aiuta_theme_toggles.dart';
import 'package:aiuta_flutter/configuration/toggles/aiuta_toggles.dart';
import 'package:aiuta_flutter/models/product/aiuta_product.dart';
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
        subscriptionId: "YOUR_SUBSCRIPTION_ID",
        apiKey: "YOUR_API_KEY",
      ),
      dimensions: AiutaDimensions(
        grabberPaddingTop: 16,
        grabberWidth: 16,
      ),
      toggles: AiutaToggles(
        isHistoryAvailable: true,
        isWishlistAvailable: true,
        isPreOnboardingAvailable: true,
      ),
      language: StandardLanguage(
        language: DefaultAiutaLanguages.english,
        brand: "YOUR Brand",
        termsOfServiceUrl: "https://brand.com/tos",
        privacyPolicyUrl: "https://brand.com/pp",
      ),
      listeners: AiutaListeners(
        addToWishlistClick: (skuItem) async {
          // Do update staff
          return skuItem;
        },
        addToCartClick: (skuItem) async {
          // Do update staff
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
        toggles: AiutaThemeToggles(
          isOnboardingAppBarExtended: true,
          isMainAppbarReversed: true,
          isShadowsReduced: true,
          isDelimitersExtended: true,
        ),
      ),
    ),
  );

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Aiuta SDK example app'),
        ),
        body: Center(
          child: TextButton(
            style: ButtonStyle(
              foregroundColor: WidgetStateProperty.all<Color>(Colors.blue),
              textStyle: WidgetStateProperty.all<TextStyle>(
                  const TextStyle(fontSize: 20)),
            ),
            onPressed: () {
              _aiuta.startAiutaFlow(
                product: AiutaProduct(
                  skuId: "YOUR sku id",
                  catalogName: "YOUR catalog name",
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
        ),
      ),
    );
  }
}
