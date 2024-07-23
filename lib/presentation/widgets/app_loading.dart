import 'package:flutter/material.dart';
import 'package:bloc_clean_architectural_demo/core/theme/app_color.dart';

class AppLoading extends StatelessWidget {
  const AppLoading({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Center(
        child: CircularProgressIndicator(
      color: AppColor.primaryColor,
    ));
  }
}
