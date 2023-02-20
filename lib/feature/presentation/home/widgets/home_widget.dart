import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class HomeWidget extends StatelessWidget {
   HomeWidget({
     Key? key,
     required this.controller,
     required this.back,
     required this.forward,
   }) : super(key: key);

 final WebViewController controller;
 final Function back;
 final Function forward;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('webview'),
        actions: [
          IconButton(
              onPressed: () async => back(),
              icon: Icon(Icons.arrow_back_ios),
          ),
          IconButton(
            onPressed: () async => forward(),
            icon: Icon(Icons.arrow_forward_ios),
        ),
        const SizedBox(width: 20,)
        ],
      ),
      body: WebViewWidget(
        controller: controller,
      ),
    );
  }
}
