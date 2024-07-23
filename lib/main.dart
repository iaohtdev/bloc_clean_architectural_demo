import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc_clean_architectural_demo/core/network/network_infor.dart';
import 'package:bloc_clean_architectural_demo/core/router/app_pages.dart';
import 'package:bloc_clean_architectural_demo/core/router/app_routes.dart';
import 'package:bloc_clean_architectural_demo/core/theme/theme.dart';
import 'package:bloc_clean_architectural_demo/di.dart';
import 'package:bloc_clean_architectural_demo/domain/repositories/favorite_repository.dart';
import 'package:bloc_clean_architectural_demo/domain/repositories/product_repository.dart';
import 'package:bloc_clean_architectural_demo/presentation/cubits/favorite/favorite_cubit.dart';
import 'package:bloc_clean_architectural_demo/presentation/cubits/product/product_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupDI();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              ProductCubit(getIt<ProductRepository>(), getIt<NetworkInfo>()),
        ),
        BlocProvider(
          create: (context) => FavoriteCubit(
            getIt<FavoriteRepository>(),
          ),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: AppTheme.themeApp,
        onGenerateRoute: AppPages.onGenerateRoute,
        initialRoute: Routes.home,
      ),
    );
  }
}
