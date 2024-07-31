import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hostel_management/features/auth/screens/login_screen.dart';
import '../../common/assets_path.dart';
import '../../theme/colors.dart';
import '../../theme/text_theme.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.greenColor,
        centerTitle: false,
        title: Text(
          "Profile",
          style: AppTextTheme.labelStyle.copyWith(
            fontSize: 21,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
            size: 25,
          ),
        ),
        actions: [
          InkWell(
            onTap: () {
              Get.to(const LoginScreen());
            },
            child: const Row(
              children: [
                Icon(
                  Icons.logout,
                  size: 30,
                  color: Colors.white,
                ),
                SizedBox(width: 15,)
              ],
            ),
          )
        ],
      )
    );
  }
}
