import 'package:bloc_clean_architectural_demo/core/router/app_routes.dart';

import 'package:flutter/material.dart';
import 'package:bloc_clean_architectural_demo/presentation/views/favorites/favorites_screen.dart';
import 'package:bloc_clean_architectural_demo/presentation/views/home/home_screen.dart';

class AppPages {
  static Route? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.home:
        return customPageRoute(
            pageBuilder: (context, animation, secondaryAnimation) =>
                const HomeScreen());
      case Routes.favorites:
        return customPageRoute(
            pageBuilder: (context, animation, secondaryAnimation) =>
                const FavoritesScreen());

      default:
        return customPageRoute(
            pageBuilder: (context, animation, secondaryAnimation) =>
                const HomeScreen());
    }
  }
}

customPageRoute(
    {required Widget Function(
      BuildContext context,
      Animation<double> animation,
      Animation<double> secondaryAnimation,
    ) pageBuilder,
    RouteSettings? settings}) {
  return PageRouteBuilder(
      settings: settings,
      pageBuilder: pageBuilder,
      transitionsBuilder: (context, animation, secondaryAnimation, child) =>
          SlideTransition(
            position: Tween<Offset>(
              begin: const Offset(1.0, 0.0),
              end: Offset.zero,
            ).animate(animation),
            child: child,
          ),
      transitionDuration: const Duration(milliseconds: 200));
}
