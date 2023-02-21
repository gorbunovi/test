import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:http/http.dart' as http;
import 'package:test_work/core/platform/network_info.dart';
import 'package:test_work/feature/data/datasources/local/local_data_source.dart';
import 'package:test_work/feature/data/datasources/remote/remote_data_source.dart';
import 'package:test_work/feature/data/repositories/catalog_repositories_impl.dart';
import 'package:test_work/feature/domain/repositories/catalog_repository.dart';
import 'package:test_work/feature/domain/usecases/get_url.dart';

import 'feature/presentation/home/controller/home_controller.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // Cubit
  sl.registerFactory(() => HomeController(getUrl:  sl()));

  //UseCases
  sl.registerLazySingleton(() => GetUrl(sl()));
  //Repository
  sl.registerLazySingleton<UrlRepository>(
        () => UrlRepositoryImpl(
      catalogLocalDataSorce: sl(),
      catalogRemoteDataSource: sl(),
      networkInfo: sl(),
    ),
  );

  sl.registerLazySingleton<CatalogLocalDataSorce>(
        () => UrlLocalDataSorceImpl(),
  );

  sl.registerLazySingleton<CatalogRemoteDataSource>(
        () => UrlRemoteDataSourceImpl(client: sl()),
  );
  //Core
  sl.registerLazySingleton<NetworkInfo>(
        () => NetworkInfoImp(sl()),
  );
  //External
  sl.registerLazySingleton(() => http.Client());
  sl.registerLazySingleton(() => InternetConnectionChecker());
}
