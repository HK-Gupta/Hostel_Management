import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:hostel_management/common/assets_path.dart';
import 'package:hostel_management/common/custom_text_field.dart';
import 'package:hostel_management/features/auth/screens/register_screen.dart';
import 'package:hostel_management/theme/colors.dart';
import 'package:hostel_management/theme/text_theme.dart';
import 'package:get/get.dart';

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
                    child: Image.asset(
                        ImagePaths.hostelPath,
                      height: 250,
                      width: 200,
                    ),
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
                  CustomButton(
                      buttonText: "Login",
                    buttonColor: AppColors.light,
                    onTap: () {
                        if(formKey.currentState!.validate()) {
                          print("Validated");
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
                          Get.to(const RegisterScreen());
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
