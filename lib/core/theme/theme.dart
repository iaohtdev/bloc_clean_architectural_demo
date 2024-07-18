import 'package:bloc_clean_architectural_demo/core/theme/app_textstyle.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static final themeApp = ThemeData(
      fontFamily: AppTextStyles.fontRegular,
      colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
      useMaterial3: true,
      scaffoldBackgroundColor: Colors.black,
      appBarTheme: const AppBarTheme(
          backgroundColor: Colors.black, surfaceTintColor: Colors.black));
}
