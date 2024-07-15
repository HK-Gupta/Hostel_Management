import 'package:flutter/material.dart';

LinearGradient linearColor() {
    return LinearGradient(
        colors: AppColors.colors,
      begin: Alignment.bottomLeft,
      end: Alignment.topRight,
      stops: const[0.4, 0.7],
      tileMode: TileMode.repeated,
    );
}
LinearGradient backgroundLinearColor() {
  return const LinearGradient(
      colors: [Color(0xffF4FDFF), Color(0xffD7E0FF)],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    stops: [0.4, 0.7],
    tileMode: TileMode.repeated,
  );
}

class AppColors {
  AppColors._();

  static const Color primaryColor = Color(0xFF11212E);
  static const Color appBarColor = Color(0XFF0B2C47);
  static const Color greenColor = Color(0xff2E8B57);
  static const Color lightBlue = Color(0xFF6DA7FF);
  static const Color secondaryColor = Color(0xFF0B2C47);
  static const Color backgroundColor = Colors.white;
  static const Color formLabelColor = greenColor;
  static const Color light = Color(0xFFFFFFFF);
  static const Color greyDk = Color(0xff9091AD);
  static const Color rewardBackgroundColor = Color(0xFF18122B);
  static const Color buttonColor = Color(0xF1F1F1F1);
  static const Color eventCardColor = Color(0xFFF1F3FF);
  static const Color chatBackgroundColor = Color(0xFFF1F3FF);

  static List<Color> colors = [
    const Color(0xff3765DD),
    const Color(0xff7464D2)
  ];
  static List<Color> winnerBackgroundColors = [
    const Color(0xff6C00FF),
    const Color(0xff7147E5),
  ];
}