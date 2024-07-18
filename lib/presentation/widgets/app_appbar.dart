import 'package:bloc_clean_architectural_demo/core/theme/app_color.dart';
import 'package:bloc_clean_architectural_demo/core/theme/app_textstyle.dart';
import 'package:bloc_clean_architectural_demo/gen/assets.gen.dart';
import 'package:bloc_clean_architectural_demo/utils/extensions/app_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AppAppBar extends StatelessWidget implements PreferredSize {
  AppAppBar({super.key, this.onTap});
  final Function()? onTap;

  final FocusNode focusNode = FocusNode();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GestureDetector(
        onTap: () => focusNode.unfocusNode(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      focusNode.unfocusNode();
                    },
                    child: Text(
                      'CineX',
                      style: AppTextStyles.textStyleBold(
                          fontSize: 28, color: AppColor.primaryColor),
                    ),
                  )
                ],
              ),
              Row(
                children: [
                  SvgPicture.asset(
                    Assets.icons.iconNotification,
                    color: Colors.white,
                    height: 25,
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget get child => throw UnimplementedError();

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
