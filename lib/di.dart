import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:bloc_clean_architectural_demo/core/config/dio_config.dart';
import 'package:bloc_clean_architectural_demo/core/network/network_infor.dart';
import 'package:bloc_clean_architectural_demo/data/datasources/favorite_remote_data_source.dart';
import 'package:bloc_clean_architectural_demo/data/datasources/product_remote_data_source.dart';
import 'package:bloc_clean_architectural_demo/data/models/product_model.dart';
import 'package:bloc_clean_architectural_demo/data/repositories/favorite_repository_impl.dart';
import 'package:bloc_clean_architectural_demo/data/repositories/product_repository_impl.dart';
import 'package:bloc_clean_architectural_demo/domain/repositories/favorite_repository.dart';
import 'package:bloc_clean_architectural_demo/domain/repositories/product_repository.dart';

final GetIt getIt = GetIt.instance;

Future<void> setupDI() async {
  // Initialize Hive
  await Hive.initFlutter();
  Hive.registerAdapter(ProductItemAdapter());
  final favoritesBox = await Hive.openBox<ProductItem>('favorites');

  // Register Dio
  getIt.registerLazySingleton<Dio>(() => Dio(DioConfig.options));

  // Register Local Data Source
  getIt.registerLazySingleton<FavoriteLocalDataSource>(
      () => FavoriteLocalDataSourceImpl(favoritesBox));

  // Register Remote Data Source
  getIt.registerLazySingleton<ProductDataSource>(
      () => ProductRemoteDataSourceImpl());

  // Register Repositories
  getIt.registerLazySingleton<ProductRepository>(
      () => ProductRepositoryImpl(getIt()));
  getIt.registerLazySingleton<FavoriteRepository>(
      () => FavoriteRepositoryImpl(localDataSource: getIt()));

  // Network Info
  getIt.registerLazySingleton<NetworkInfo>(() => NetworkInfo(Connectivity()));
}

Dio get dio => getIt<Dio>();
