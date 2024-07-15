import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hostel_management/theme/colors.dart';

class AppTextTheme {
  static TextStyle appBarStyle = GoogleFonts.inter(
    color: AppColors.secondaryColor,
    fontWeight: FontWeight.w600,
    fontSize: 26,
  );

  static TextStyle labelStyle = GoogleFonts.inter(
    color: AppColors.secondaryColor,
    fontWeight: FontWeight.w500,
    fontSize: 16,
  );

  static TextStyle primaryStyle = GoogleFonts.inter(
    color: AppColors.secondaryColor,
    fontWeight: FontWeight.w500,
    fontSize: 14,
  );

  static TextStyle hintStyle = GoogleFonts.inter(
    color: AppColors.secondaryColor,
    fontWeight: FontWeight.w400,
    fontSize: 14,
  );

  static TextStyle buttonStyle = GoogleFonts.inter(
    color: AppColors.secondaryColor,
    fontWeight: FontWeight.w500,
    fontSize: 14,
  );

  static TextStyle socialTextStyle = GoogleFonts.inter(
    color: AppColors.primaryColor,
    fontWeight: FontWeight.w500,
    fontSize: 16,
    height: 18,
  );

  static TextStyle dmTextStyle = GoogleFonts.inter(
    color: AppColors.secondaryColor,
    fontWeight: FontWeight.w500,
    fontSize: 15,
  );

  static TextStyle chatStyle = GoogleFonts.inter(
    color: AppColors.secondaryColor,
    fontWeight: FontWeight.w500,
    fontSize: 16,
    height: 0
  );

  static TextTheme lightTextTheme = const TextTheme();
  static TextTheme darkTextTheme = const TextTheme();
}