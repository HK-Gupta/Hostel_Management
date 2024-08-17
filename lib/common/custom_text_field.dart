import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hostel_management/common/my_form_field.dart';
import 'package:hostel_management/theme/colors.dart';
import 'package:hostel_management/theme/text_theme.dart';

class CustomTextField extends StatelessWidget {
  final int? maxLines, minLines;
  final String? inputHint;
  final Widget? suffixIcon, prefixIcon;
  final bool? obscureText;
  final TextInputType? inputKeyBoardType;
  final Color? inputFillColor;
  final InputBorder? border, focusedBorder, enabledBorder;
  final Function()? clickMe;
  final String? Function(String?)? validator;
  final TextEditingController? controller;
  final TextStyle? hintStyle;
  final Function(String)? onChanged;

  const CustomTextField({super.key, this.maxLines, this.minLines, this.inputHint, this.suffixIcon, this.prefixIcon, this.obscureText, this.inputKeyBoardType, this.inputFillColor, this.border, this.focusedBorder, this.enabledBorder, this.clickMe, this.validator, this.controller, this.hintStyle, this.onChanged});



  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MyFormField(
            enabledBorder: enabledBorder ??
              OutlineInputBorder(
                borderSide: const BorderSide(
                  color: AppColors.primaryColor,
                ),
                borderRadius: BorderRadius.circular(15)
              ),
            maxLines: maxLines ?? 1,
            minLines: minLines ?? 1,
            controller: controller,
            validator: validator,
            inputFilled: true,
            inputFillColor: inputFillColor ?? AppColors.light,
            inputHint: inputHint,
            obscureText: obscureText,
            inputKeyboardType: inputKeyBoardType,
            contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            border: border ?? OutlineInputBorder(
                borderSide: const BorderSide(
                  color: AppColors.primaryColor
                ),
                borderRadius: BorderRadius.circular(15)
              ),

            focusedBorder: focusedBorder?? OutlineInputBorder(
              borderSide: const BorderSide(
                color: AppColors.primaryColor,
                width: 1.5,
              ),
              borderRadius: BorderRadius.circular(15),
            ),
            suffixIcon: Padding(
              padding: const EdgeInsets.only(right: 8),
              child: suffixIcon,
            ),
            onChanged: onChanged,
            prefixIcon: prefixIcon,
            inputTextStyle: AppTextTheme.primaryStyle,
            inputHintStyle: hintStyle ?? AppTextTheme.hintStyle,
          )
        ],
      ),
    );
  }
}
