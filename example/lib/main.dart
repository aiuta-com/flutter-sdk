import 'package:aiutasdk/configuration/AiutaConfiguration.dart';
import 'package:aiutasdk/configuration/auth/AiutaAuthentication.dart';
import 'package:aiutasdk/configuration/language/AiutaLanguage.dart';
import 'package:aiutasdk/configuration/language/DefaultAiutaLanguages.dart';
import 'package:aiutasdk/configuration/listeners/AiutaListeners.dart';
import 'package:aiutasdk/configuration/mode/AiutaMode.dart';
import 'package:aiutasdk/configuration/theme/AiutaTheme.dart';
import 'package:aiutasdk/configuration/theme/colors/AiutaColors.dart';
import 'package:aiutasdk/configuration/theme/gradients/AiutaGradients.dart';
import 'package:aiutasdk/configuration/toggles/AiutaToggles.dart';
import 'package:aiutasdk/models/AiutaProduct.dart';
import 'package:flutter/material.dart';
import 'package:aiutasdk/fashionsdk.dart';

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
        isOnboardingAppBarExtended: true,
        isMainAppbarReversed: true,
      ),
      language: StandardLanguage(language: DefaultAiutaLanguages.english),
      listeners: AiutaListeners(
        addToWishlistActiveItemClick: (skuItem) async {
          // Do update staff
          return skuItem;
        },
        addToWishlistGenerateMoreItemClick: (skuItem) async {
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
          onError: "#FF00000000",
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
      ),
    ),
  );

  @override
  void initState() {
    super.initState();
    initAiutaEventStream();
  }

  void initAiutaEventStream() async {
    _aiuta.observeAiutaEvent().listen((value) {
      print('TAG_FLUTTER_CHECK - Value from native: $value');
    });
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
                skuId: "YOUR skuId",
                description: "YOUR description",
                imageUrls: [
                  "YOUR image 1",
                  "YOUR image 2",
                ],
                localizedPrice: "\$20",
                store: "YOUR store",
                inWishlist: true,
              ),
            );
          },
          child: Text('Start Aiuta'),
        ),
      ),
    );
  }
}
