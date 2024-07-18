import 'package:bloc_clean_architectural_demo/core/config/dio_config.dart';
import 'package:bloc_clean_architectural_demo/data/datasources/demo_remote_data_source.dart';
import 'package:bloc_clean_architectural_demo/data/repositories/demo_repository_impl.dart';
import 'package:bloc_clean_architectural_demo/domain/repositories/demo_repository.dart';
import 'package:get_it/get_it.dart';
import 'package:dio/dio.dart';

final GetIt getIt = GetIt.instance;

void setupLocator() {
  getIt.registerLazySingleton<Dio>(() => Dio(
        DioConfig.options,
      ));

  //register repository
  getIt
      .registerLazySingleton<CastRepository>(() => CastRepositoryImpl(getIt()));

  // Data Source
  getIt.registerLazySingleton<DemoRemoteDataSource>(
      () => DemoRemoteDataSourceImpl());
}

Dio get dio => getIt<Dio>();
