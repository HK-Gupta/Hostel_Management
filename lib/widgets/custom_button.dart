import 'package:flutter/material.dart';
import 'package:hostel_management/theme/colors.dart';
import 'package:hostel_management/theme/text_theme.dart';

class CustomButton extends StatelessWidget {
  final String buttonText;
  final Color? buttonColor;
  final VoidCallback onTap;
  const CustomButton({super.key, required this.buttonText, this.buttonColor, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: AppColors.greenColor,
        ),
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Text(
          textAlign: TextAlign.center,
          buttonText,
          style: AppTextTheme.labelStyle.copyWith(
            color: buttonColor ?? Colors.white,
            fontSize: 18
          ),
        ),
      ),
    );
  }
}
