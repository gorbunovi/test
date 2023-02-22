
import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:webview_flutter/webview_flutter.dart';
import '../../../domain/usecases/get_url.dart';
import 'index.dart';

class HomeController extends Cubit<HomeState> {
  HomeController({required this.getUrl}) : super(const Initial());
  final GetUrl getUrl;
  late String _url;
  late final WebViewController controller;

  Future<void> init() async{
    final currentState = state;
    emit(const Loading());

    final failureOrUrl = await getUrl();

    failureOrUrl.fold(
          (failure) => emit(Error(failure)),
          (resault){
        if(resault != null){
          _url = resault;
        } else {
          _url = resault;
        }
      },
    );

    controller = WebViewController()
    ..setJavaScriptMode(JavaScriptMode.unrestricted)
    ..loadRequest(Uri.parse(_url));

    emit(Page(controller: controller));
  }


  void loadLocalHTML() async {
    final html = await rootBundle.loadString('assets/index.html');
    final url = Uri.dataFromString(
      html,
      mimeType: 'text/html',
      encoding: Encoding.getByName('utf-8'),
    ).toString();

    controller.loadUrl(url);
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
