
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
    final isE =  await ballScokers();
    if(isE){
      print('эмулытор ================= $isE');
       return  const Right('pre');
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

  Future<bool> ballScokers() async {
    DeviceInfoPlugin ballinfo = DeviceInfoPlugin();
    final em = await ballinfo.androidInfo;
    var phoneModel = em.model;
    var buildProduct = em.product;
    var buildHardware = em.hardware;

    var result = (em.fingerprint.startsWith("generic") ||
        phoneModel.contains("google_sdk") ||
        phoneModel.contains("droid4x") ||
        phoneModel.contains("Emulator") ||
        phoneModel.contains("Android SDK built for x86") ||
        em.manufacturer.contains("Genymotion") ||
        buildHardware == "goldfish" ||
        buildHardware == "vbox86" ||
        buildProduct == "sdk" ||
        buildProduct == "google_sdk" ||
        buildProduct == "sdk_x86" ||
        buildProduct == "vbox86p" ||
        !em.isPhysicalDevice ||
        em.brand.contains('google') ||
        em.board.toLowerCase().contains("nox") ||
        em.bootloader.toLowerCase().contains("nox") ||
        buildHardware.toLowerCase().contains("nox") ||
        buildProduct.toLowerCase().contains("nox"));

    if (result) return true;
    result = result ||
        (em.brand.startsWith("generic") && em.device.startsWith("generic"));
    if (result) return true;
    result = result || ("google_sdk" == buildProduct);
    return result;
  }
}
