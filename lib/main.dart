import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hostel_management/api_services/api_provider.dart';
import 'package:hostel_management/api_services/api_utils.dart';
import 'package:hostel_management/splash_screen.dart';
import 'package:hostel_management/theme/colors.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

import 'features/home/screens/home_screen.dart';

void main() async{
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ApiProvider(
            baseUrl: ApiUtils.baseUrl,
            httpClient: http.Client()
          )
        )
      ],
      child: GetMaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primaryColor),
          useMaterial3: true,
        ),
        home: SplashScreen()
      ),
    );
  }
}

// 38:00 -- 15/07
// 01:48 -- 17/07

