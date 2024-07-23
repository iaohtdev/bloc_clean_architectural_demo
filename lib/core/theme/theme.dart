import 'package:bloc_clean_architectural_demo/core/theme/app_textstyle.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static final themeApp = ThemeData(
      fontFamily: AppTextStyles.fontRegular,
      colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
      useMaterial3: true,
      scaffoldBackgroundColor: Colors.white,
      appBarTheme: AppBarTheme(
          backgroundColor: Colors.white.withOpacity(0.9),
          surfaceTintColor: Colors.white));
}
