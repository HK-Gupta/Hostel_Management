import 'package:flutter/material.dart';
import 'package:hostel_management/theme/colors.dart';
import 'package:hostel_management/theme/text_theme.dart';

AppBar buildAppBar(BuildContext context, String? title, bool isAvatar) {
  return AppBar(
    backgroundColor: AppColors.greenColor,
    centerTitle: false,
    leading: InkWell(
      onTap: () {
        Navigator.pop(context);
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
      const Row(
        children: [
          Icon(
            Icons.perm_identity_rounded,
            size: 40,
            color: Colors.white,
          ),
          SizedBox(width: 10,)
        ],
      ): const SizedBox()
    ],
  );
}