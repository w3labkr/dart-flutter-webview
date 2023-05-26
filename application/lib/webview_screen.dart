import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:webview_flutter/webview_flutter.dart';

import 'bottom_nav_bar.dart';

class WebviewScreen extends StatefulWidget {
  const WebviewScreen({Key? key}) : super(key: key);

  @override
  State<WebviewScreen> createState() => _WebviewScreenState();
}

class _WebviewScreenState extends State<WebviewScreen> {
  late final WebViewController _controller;
  final String _initialUrl = 'https://flutter.dev';

  int _loadingPercentage = 0;

  @override
  void initState() {
    super.initState();

    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(NavigationDelegate(
        onPageStarted: (url) => setState(() => _loadingPercentage = 0),
        onProgress: (progress) => setState(() => _loadingPercentage = progress),
        onPageFinished: (url) => setState(() => _loadingPercentage = 100),
      ))
      ..loadRequest(Uri.parse(_initialUrl));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(0),
        child: AppBar(
          backgroundColor: Colors.white,
        ),
      ),
      body: Stack(
        children: [
          AnnotatedRegion<SystemUiOverlayStyle>(
            value: SystemUiOverlayStyle.light,
            child: SafeArea(
                bottom: false, child: WebViewWidget(controller: _controller)),
          ),
          if (_loadingPercentage < 100)
            Center(
              child:
                  CircularProgressIndicator(value: _loadingPercentage / 100.0),
            ),
        ],
      ),
      bottomNavigationBar:
          BottomNavBar(initialUrl: _initialUrl, controller: _controller),
    );
  }
}
