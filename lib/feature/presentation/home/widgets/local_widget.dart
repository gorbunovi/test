import 'package:flutter/material.dart';

class LocalWidget extends StatelessWidget {
   LocalWidget({
    Key? key,
     required this.url,
    required this.back,
    required this.forward,
  }) : super(key: key);

  // late final WebViewPlusController _controller;
  final String url;
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
      body:WebViewPlus(
        onWebViewCreated: (controller) {
          // this._controller = controller;
          controller.loadUrl(url);
        },
      ),
    );
  }
}
