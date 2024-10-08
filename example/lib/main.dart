import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';
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
  String _platformVersion = 'Unknown';
  final _fashionsdkPlugin = Fashionsdk();

  @override
  void initState() {
    super.initState();
    initPlatformState();
    initAiutaEventStream();
  }

  void initAiutaEventStream() async {
    _fashionsdkPlugin.observeAiutaEvent().listen((value) {
      print('TAG_FLUTTER_CHECK - Value from native: $value');
    });
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initPlatformState() async {
    String platformVersion;
    // Platform messages may fail, so we use a try/catch PlatformException.
    // We also handle the message potentially returning null.
    try {
      platformVersion = 'Unknown platform version';
    } on PlatformException {
      platformVersion = 'Failed to get platform version.';
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      _platformVersion = platformVersion;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: const Text('Plugin example app'),
          ),
          body: Column(
            children: [
              TextButton(
                style: ButtonStyle(
                  foregroundColor: MaterialStateProperty.all<Color>(Colors.blue),
                ),
                onPressed: () {
                  _fashionsdkPlugin.startAiutaFlow();
                },
                child: Text('Start Aiuta'),
              ),
              TextButton(
                style: ButtonStyle(
                  foregroundColor: MaterialStateProperty.all<Color>(Colors.blue),
                ),
                onPressed: () {
                  _fashionsdkPlugin.startAiutaShareAssetFlow();
                },
                child: Text('Start Aiuta Share Drawable flow'),
              ),
              TextButton(
                style: ButtonStyle(
                  foregroundColor: MaterialStateProperty.all<Color>(Colors.blue),
                ),
                onPressed: () {
                  _fashionsdkPlugin.startAiutaBottomSheetFlow();
                },
                child: Text('Start Aiuta Bottom sheet flow'),
              ),
            ],
          )
      ),
    );
  }
}
