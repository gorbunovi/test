
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:webview_flutter/webview_flutter.dart';

import 'index.dart';

class HomeController extends Cubit<HomeState> {
  HomeController() : super(const Initial());

  String url = 'https://ya.ru/';
  late final WebViewController controller;

  Future<void> init() async{
    controller = WebViewController()
    ..setJavaScriptMode(JavaScriptMode.unrestricted)
    ..loadRequest(Uri.parse(url));
    final currentState = state;
    emit(const Loading());
    emit(Page(controller: controller));
  }

  Future<void> bac() async{
    if(await controller.canGoBack()){
      emit(const Loading());
      controller.goBack();
      emit(Page(controller: controller));
    }else return;
  }

    Future<void> forward() async{
    if(await controller.canGoForward()){
      emit(const Loading());
      controller.goForward();
      emit(Page(controller: controller));
    }else return;
  }
}
