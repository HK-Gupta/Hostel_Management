import 'package:flutter/material.dart';
import 'package:hostel_management/theme/colors.dart';
import 'package:hostel_management/theme/text_theme.dart';

AppBar buildAppBar(BuildContext context, String? title) {
  return AppBar(
    backgroundColor: AppColors.greenColor,
    leading: InkWell(
      onTap: () {
        Navigator.pop(context);
      },
      child: const Icon(
        Icons.arrow_back_ios,
        color: Colors.white,
      ),
    ),
    title: Text(
      title?? "Registration",
      style: AppTextTheme.labelStyle.copyWith(
        fontSize: 24,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
    ),
  );
}