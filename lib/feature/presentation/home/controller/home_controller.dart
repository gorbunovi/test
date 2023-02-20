
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:webview_flutter/webview_flutter.dart';

import 'index.dart';

class HomeController extends Cubit<HomeState> {
  HomeController() : super(const Initial());

  Future<void> init() async{
    final WebViewController controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(
        NavigationDelegate(
            onProgress: (int progress) {
            // Update loading bar.
            },
          onPageStarted: (String url) {},
          onPageFinished: (String url) {},
          onWebResourceError: (WebResourceError error) {},
          onNavigationRequest: (NavigationRequest request) {
            if (request.url.startsWith('https://www.google.ru/')) {
             return NavigationDecision.prevent;
            }
            return NavigationDecision.navigate;
          },
        ),
      )
    ..loadRequest(Uri.parse('https://ya.ru/'));
    final currentState = state;
    emit(const Loading());
        emit(Page(controller: controller));
  }
}
