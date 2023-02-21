
import 'package:dartz/dartz.dart';
import 'package:test_work/core/error/exception.dart';
import 'package:test_work/core/error/failure.dart';
import 'package:test_work/core/platform/network_info.dart';
import 'package:test_work/feature/data/datasources/local/local_data_source.dart';
import 'package:test_work/feature/data/datasources/remote/remote_data_source.dart';
import 'package:test_work/feature/domain/repositories/catalog_repository.dart';

class UrlRepositoryImpl implements UrlRepository {
  UrlRepositoryImpl({
    required this.catalogLocalDataSorce,
    required this.catalogRemoteDataSource,
    required this.networkInfo,
  });

  final CatalogLocalDataSorce catalogLocalDataSorce;
  final CatalogRemoteDataSource catalogRemoteDataSource;
  final NetworkInfo networkInfo;

  @override
  Future<Either<Failure, String>> getUrl() async {
    if(await networkInfo.isConnected) {
      try {
        final url = await catalogRemoteDataSource.getUrl();
        return Right(url);
      } on CacheException {
        return Left(CacheFailure(''));
      }
    }else{
      try {
        final url= await catalogLocalDataSorce.getUrlLocal();
        return Right(url);
      } on CacheException {
        return Left(CacheFailure(''));
      }
    }
  }
}
