import 'package:flutter/material.dart';
import 'package:hostel_management/features/auth/screens/login_screen.dart';
import 'package:hostel_management/features/home/screens/home_screen.dart';

import 'api_services/api_utils.dart';

class AuthController {
  static Future<void> checkAuthStatus(BuildContext context) async {
    await ApiUtils.loadUserDetails(); // Load user details from SharedPreferences

    // Check if user data is present
    if (ApiUtils.id.isNotEmpty && ApiUtils.email.isNotEmpty) {
      // User is logged in, navigate to home screen
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => const HomeScreen()));
    } else {
      // User is not logged in, navigate to login screen
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => const LoginScreen()));
    }
  }
}
