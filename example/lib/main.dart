import 'package:aiutasdk/aiutasdk.dart';
import 'package:aiutasdk/configuration/aiuta_configuration.dart';
import 'package:aiutasdk/configuration/auth/aiuta_authentication.dart';
import 'package:aiutasdk/configuration/language/aiuta_language.dart';
import 'package:aiutasdk/configuration/language/default_aiuta_languages.dart';
import 'package:aiutasdk/configuration/listeners/aiuta_listeners.dart';
import 'package:aiutasdk/configuration/mode/aiuta_mode.dart';
import 'package:aiutasdk/configuration/theme/aiuta_theme.dart';
import 'package:aiutasdk/configuration/theme/colors/aiuta_colors.dart';
import 'package:aiutasdk/configuration/theme/gradients/aiuta_gradients.dart';
import 'package:aiutasdk/configuration/theme/images/aiuta_images.dart';
import 'package:aiutasdk/configuration/theme/toggles/aiuta_theme_toggles.dart';
import 'package:aiutasdk/configuration/toggles/aiuta_toggles.dart';
import 'package:aiutasdk/models/product/aiuta_product.dart';
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
        images: AiutaImages(
          preonboardingImagePath: "YOUR preonboardingImagePath",
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
          title: const Text('Plugin example app'),
        ),
        body: TextButton(
          style: ButtonStyle(
            foregroundColor: WidgetStateProperty.all<Color>(Colors.blue),
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
    );
  }
}
