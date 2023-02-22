import 'dart:convert';



import 'package:http/http.dart' as http;

import 'package:flutter/services.dart' show rootBundle;

abstract class CatalogRemoteDataSource {
  /// Calls the https://rickandmortyapi.com/api/character/?page=1 endpoint.
  ///
  /// Throws a [ServerException] for all error codes.
  Future<String> getUrl();
}

class UrlRemoteDataSourceImpl implements CatalogRemoteDataSource {
  http.Client client;

  UrlRemoteDataSourceImpl({required this.client});


  @override
  Future<String> getUrl() async{
    return 'https://getfitshape.com/en/coaches/13';
  }
}