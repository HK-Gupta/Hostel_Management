import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hostel_management/common/assets_path.dart';
import 'package:hostel_management/features/students/profile_screen.dart';
import 'package:hostel_management/theme/colors.dart';
import 'package:hostel_management/theme/text_theme.dart';
import 'package:get/get.dart';

AppBar buildAppBar(BuildContext context, String? title, bool isAvatar) {
  return AppBar(
    backgroundColor: AppColors.greenColor,
    centerTitle: false,
    leading: InkWell(
      onTap: () {
        if(!isAvatar) {
          Navigator.pop(context);
        }
      },
      child: isAvatar ?
        const Icon(
          Icons.menu,
          color: Colors.white,
          size: 30,
        ): const Icon(
          Icons.arrow_back_ios,
          color: Colors.white,
          size: 25,
      ),
    ),
    title: Text(
      title?? "Registration",
      style: AppTextTheme.labelStyle.copyWith(
        fontSize: 21,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
    ),
    actions: [
      isAvatar?
      InkWell(
        onTap: () {
          Get.to(const ProfileScreen());
        },
        child: Row(
          children: [
            Image.asset(
              ImagePaths.person,
              width: 40,
            ),
            SizedBox(width: 10,)
          ],
        ),
      ): const SizedBox()
    ],
  );
}