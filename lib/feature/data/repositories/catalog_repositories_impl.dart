
import 'dart:io';

import 'package:dartz/dartz.dart';
// import 'package:device_info/device_info.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:test_work/core/error/exception.dart';
import 'package:test_work/core/error/failure.dart';
import 'package:test_work/core/platform/network_info.dart';
import 'package:test_work/feature/data/datasources/local/local_data_source.dart';
import 'package:test_work/feature/data/datasources/remote/remote_data_source.dart';
import 'package:test_work/feature/domain/repositories/catalog_repository.dart';

class UrlRepositoryImpl implements UrlRepository {
  UrlRepositoryImpl({
    required this.urlLocalDataSorce,
    required this.urlRemoteDataSource,
    required this.networkInfo,
  });

  final UrlLocalDataSource urlLocalDataSorce;
  final UrlRemoteDataSource urlRemoteDataSource;
  final NetworkInfo networkInfo;



  // подключение фаербэйс и получение ссылки
//сохранение ссылки

  @override
  Future<Either<Failure, String>> getUrl() async {
    String url;
    if(Platform.isAndroid){
      DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
      AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
      if(androidInfo.isPhysicalDevice){
       return  const Right('pre');
      }
    }
    if(await networkInfo.isConnected) {
      try {
        if(await urlLocalDataSorce.containsKey('url')){
          url= await urlLocalDataSorce.getUrlFromCache();
          print('local data source');
        }else{
          url = await urlRemoteDataSource.getUrl();
          await urlLocalDataSorce.urlToCache(url);
          print('remove data source');
        }
        return Right(url);
      } on CacheException {
        return Left(CacheFailure(''));
      }
    }else{
      try {
        return const Right('no internet');
      } on CacheException {
        return Left(CacheFailure(''));
      }
    }
    //////////////////////////////////////
  }
}
