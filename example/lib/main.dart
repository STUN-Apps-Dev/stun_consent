import 'package:flutter/material.dart';
import 'package:stun_consent/consent_config.dart';
import 'package:stun_consent/stun_consent.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool _hasConsent = false;
  bool _wasShown = false;

  @override
  void initState() {
    super.initState();
    _init();
  }

  Future<void> _init() async {
    StunConsent.enableDebug(true);
    _hasConsent = await StunConsent.hasUserConsent;
    _wasShown = await StunConsent.dialogWasShown;
    setState(() {});
  }

  Future<void> _showConsent() async {
    await StunConsent.showConsent(
      context,
      ConsentConfig(
        appIconPath: 'assets/ic_launcher.png',
        appName: 'Stun Consent Demo App',
        contentPath: 'assets/content.json',
      ),
    );
    _hasConsent = await StunConsent.hasUserConsent;
    _wasShown = await StunConsent.dialogWasShown;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Stun Consent Demo App'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: ElevatedButton(
              onPressed: _showConsent,
              child: const Text('Show Consent'),
            ),
          ),
          const SizedBox(height: 16),
          Text('Has user consent: $_hasConsent'),
          const SizedBox(height: 16),
          Text('Was dialog shown: $_wasShown'),
        ],
      ),
    );
  }
}
