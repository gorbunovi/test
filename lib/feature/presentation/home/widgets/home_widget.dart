import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class HomeWidget extends StatelessWidget {
   HomeWidget({Key? key, required this.controller}) : super(key: key);

 final WebViewController controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('webview'),
      ),
      body: WebViewWidget(
        controller: controller,
      ),
    );
  }
}
