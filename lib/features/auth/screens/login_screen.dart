import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:hostel_management/api_services/api_calls.dart';
import 'package:hostel_management/common/assets_path.dart';
import 'package:hostel_management/common/custom_text_field.dart';
import 'package:hostel_management/features/auth/screens/register_screen.dart';
import 'package:hostel_management/features/home/screens/home_screen.dart';
import 'package:hostel_management/theme/colors.dart';
import 'package:hostel_management/theme/text_theme.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../../../widgets/custom_button.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  static final formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  ApiCalls apiCalls = ApiCalls();
  bool isLoading = false;

  Future<void> login() async {
    setState(() {
      isLoading = true;
    });
    await apiCalls.handleLogin(context, emailController.text, passwordController.text);
    setState(() {
      isLoading = false;
    });
  }

  @override
  void dispose() {
    emailController.dispose;
    passwordController.dispose;
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Form(
        key: formKey,
          child: SafeArea(
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Lottie.asset(
                      LottiePath.home,
                      width: 250,
                      height: 200
                    )
                  ),
                  const SizedBox(height: 25,),
                  const Center(
                    child: Text(
                      "Login to your account",
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.black87 ,
                        fontWeight: FontWeight.w700
                      ),
                    ),
                  ),
                  const SizedBox(height: 20,),
                  Text(
                    "Email",
                    style: AppTextTheme.labelStyle,
                  ),
                  CustomTextField(
                    controller: emailController,
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: AppColors.greyDk),
                      borderRadius: BorderRadius.circular(15)
                    ),
                    inputHint: "Enter Your Email Id",
                    validator: (value) {
                      if(value!.isEmpty) {
                        return 'Email is required';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 10,),
                  Text(
                    "Password",
                    style: AppTextTheme.labelStyle,
                  ),
                  CustomTextField(
                    controller: passwordController,
                    obscureText: true,
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: AppColors.greyDk),
                      borderRadius: BorderRadius.circular(15)
                    ),
                    inputHint: "Enter the Password",
                    validator: (value) {
                      if(value!.isEmpty) {
                        return 'Password is weak';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 40,),
                  isLoading ? const Center(child: CircularProgressIndicator()) :
                  CustomButton(
                      buttonText: "Login",
                    buttonColor: AppColors.light,
                    onTap: () {
                        if(formKey.currentState!.validate()) {
                            login();
                        }
                    },
                  ),
                  const SizedBox(height: 15,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                          "Don't have an account? ",
                        style: AppTextTheme.dmTextStyle,
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => const RegisterScreen()));
                        },
                        child: Text(
                            "Click to Register",
                          style: AppTextTheme.dmTextStyle.copyWith(
                            color: AppColors.lightBlue
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          )
      ),
    );
  }
}
