import 'dart:convert';

import 'package:flutter/services.dart' show rootBundle;


abstract class CatalogLocalDataSorce{
  Future<String> getUrlLocal();
}


class UrlLocalDataSorceImpl implements CatalogLocalDataSorce{
  UrlLocalDataSorceImpl();

  @override
  Future<String> getUrlLocal() async{
    return 'https://ya.ru/';
  }
}