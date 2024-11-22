import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); // Ensures Flutter bindings are initialized before running the app.
  await OneSignal.shared.setAppId("5e423775-67c6-42de-8a63-d2e6bbfa7219");  // Initialize OneSignal
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter WebView App',
      home: WebViewApp(initialUrl: 'https://flutter.dev'), // Provide an initial URL
    );
  }
}

class WebViewApp extends StatefulWidget {
  final String initialUrl; // Class member variable for URL
  final JavascriptMode javascriptMode; // Add javascriptMode as a parameter

  WebViewApp({required this.initialUrl, this.javascriptMode = JavascriptMode.unrestricted});  // Constructor to initialize both initialUrl and javascriptMode

  @override
  State<WebViewApp> createState() => _WebViewAppState();
}

class _WebViewAppState extends State<WebViewApp> {
  late final WebViewController _controller;

  @override
  void initState() {
    super.initState();
    // WebView initialization to ensure WebView is ready when the app starts
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter WebView App'),
      ),
      body: WebViewApp(
        initialUrl: widget.initialUrl,  // Use the initialUrl passed into the widget
        javascriptMode: widget.javascriptMode,  // Use javascriptMode passed into the widget
        onWebViewCreated: (WebViewController controller) {
          _controller = controller;
        },
      ),
    );
  }
}
