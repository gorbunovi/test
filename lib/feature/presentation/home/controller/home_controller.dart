
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
  late final WebViewController webcontroller;

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

    if (_url == 'no internet'){
      emit(const Internet());
    }else{
      webcontroller = WebViewController()
        ..setJavaScriptMode(JavaScriptMode.unrestricted)
        ..loadRequest(Uri.parse(_url));
      emit(Page(webViewController: webcontroller));
    }


  }





}
