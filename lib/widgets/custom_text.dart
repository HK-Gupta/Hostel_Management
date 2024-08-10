import 'package:flutter/material.dart';

import '../theme/colors.dart';
import '../theme/text_theme.dart';

class CustomText extends StatelessWidget {

  final String text;
  const CustomText({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 4),
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      width: MediaQuery.of(context).size.width,
      decoration: ShapeDecoration(
        shape: RoundedRectangleBorder(
          side: const BorderSide(
            width: 1,
            color: AppColors.greenColor,
          ),
          borderRadius: BorderRadius.circular(14),
        ),
      ),
      child: Text(text, style: AppTextTheme.socialTextStyle,),
    );
  }
}
