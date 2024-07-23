import 'package:flutter/material.dart';
import 'package:hostel_management/common/assets_path.dart';
import 'package:hostel_management/theme/text_theme.dart';

class CategoryCard extends StatelessWidget {
  final String category;
  final String image;
  VoidCallback onTap;

  CategoryCard({super.key, required this.category, required this.image, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: const ShapeDecoration(
          color: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: const BorderRadius.only(
              topRight: Radius.circular(30),
              bottomLeft: Radius.circular(30),
              bottomRight: Radius.circular(30),
            ),
          ),
          shadows: [
            BoxShadow(
              color: Color(0x7F2E8B57),
              blurRadius: 4,
              offset: Offset(1, 4),
              spreadRadius: 0
            )
          ]
        ),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              height: 70,
              width: 70,
              child: Image.asset(image),
            ),
            const SizedBox(height: 10,),
            Text(
              textAlign: TextAlign.center,
              category,
              style: AppTextTheme.primaryStyle,
            ),
            const SizedBox(height: 10,)
          ],
        ),
      ),
    );
  }
}
