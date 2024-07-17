import 'package:flutter/material.dart';
import 'package:hostel_management/features/auth/screens/login_screen.dart';
import 'package:hostel_management/features/home/screens/home_screen.dart';
import 'package:hostel_management/theme/colors.dart';
import 'package:hostel_management/theme/text_theme.dart';
import 'package:hostel_management/widgets/custom_button.dart';
import 'package:get/get.dart';
import '../../../common/assets_path.dart';
import '../../../common/custom_text_field.dart';
import 'package:lottie/lottie.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  static final formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController userNameController = TextEditingController();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  String? selectedBlock;
  String? selectedRoom;
  List<String> blockOptions = ['A', 'B'];
  List<String> roomOptionsA = ['101', '102', '103'];
  List<String> roomOptionsB = ['201', '202', '203'];

  @override
  void dispose() {
    emailController.dispose;
    passwordController.dispose;
    userNameController.dispose;
    firstNameController.dispose;
    lastNameController.dispose;
    phoneNumberController.dispose;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SafeArea(
        child: Form(
          key: formKey,
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 40,),
                Center(
                    child: Lottie.asset(
                        LottiePath.home,
                        width: 150,
                        height: 150
                    )
                ),
                const SizedBox(height: 15,),
                const Center(
                  child: const Text(
                    "Register your account",
                    style: TextStyle(
                        fontSize: 21,
                        color: Colors.black87 ,
                        fontWeight: FontWeight.w700
                    ),
                  ),
                ),
                // User Name
                const SizedBox(height: 20,),
                Text(
                  "Username",
                  style: AppTextTheme.labelStyle,
                ),
                CustomTextField(
                  controller: userNameController,
                  enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: AppColors.greyDk),
                      borderRadius: BorderRadius.circular(15)
                  ),
                  inputHint: "Enter Your Username",
                  validator: (value) {
                    if(value!.isEmpty) {
                      return 'Username is required';
                    }
                    return null;
                  },
                ),
                // First Name.
                const SizedBox(height: 7,),
                Text(
                  "First Name",
                  style: AppTextTheme.labelStyle,
                ),
                CustomTextField(
                  controller: firstNameController,
                  enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: AppColors.greyDk),
                      borderRadius: BorderRadius.circular(15)
                  ),
                  inputHint: "Enter Your First Name",
                  validator: (value) {
                    if(value!.isEmpty) {
                      return 'First Name is required';
                    }
                    return null;
                  },
                ),
                // Last Name
                const SizedBox(height: 7,),
                Text(
                  "Last Name",
                  style: AppTextTheme.labelStyle,
                ),
                CustomTextField(
                  controller: lastNameController,
                  enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: AppColors.greyDk),
                      borderRadius: BorderRadius.circular(15)
                  ),
                  inputHint: "Enter Your Last Name",
                  validator: (value) {
                    if(value!.isEmpty) {
                      return 'Last Name is required';
                    }
                    return null;
                  },
                ),
                //PhoneNumber
                const SizedBox(height: 7,),
                Text(
                  "Phone Number",
                  style: AppTextTheme.labelStyle,
                ),
                CustomTextField(
                  controller: phoneNumberController,
                  enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: AppColors.greyDk),
                      borderRadius: BorderRadius.circular(15)
                  ),
                  inputHint: "Enter Your Phone Number",
                  validator: (value) {
                    if(value!.isEmpty) {
                      return 'Phone Number is required';
                    }
                    return null;
                  },
                ),
                // Email
                const SizedBox(height: 7,),
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
                // Password
                const SizedBox(height: 7,),
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
                      return 'Password is required';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 7,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: 50,
                      decoration: ShapeDecoration(
                        shape: RoundedRectangleBorder(
                          side: const BorderSide(
                            width: 1,
                            color: AppColors.greenColor
                          ),
                          borderRadius: BorderRadius.circular(15),
                        )
                      ),
                      child: Row(
                        children: [
                          const SizedBox(width: 20,),
                          Text(
                              "Block No.",
                            style: AppTextTheme.labelStyle,
                          ),
                          const SizedBox(width: 10,),
                          DropdownButton(
                            value: selectedBlock,
                            onChanged: (String? newValue) {
                              setState(() {
                                selectedBlock = newValue;
                                selectedRoom = null;
                              });
                            },
                            items: blockOptions.map((String block) {
                              return DropdownMenuItem(
                                  value: block,
                                  child: Text(block)
                              );
                            }).toList(),
                          ),
                          const SizedBox(width: 10 ,)

                        ],
                      ),
                    ),
                    Container(
                      height: 50,
                      decoration: ShapeDecoration(
                        shape: RoundedRectangleBorder(
                          side: const BorderSide(
                            width: 1,
                            color: AppColors.greenColor
                          ),
                          borderRadius: BorderRadius.circular(15),
                        )
                      ),
                      child: Row(
                        children: [
                          const SizedBox(width: 20,),
                          Text(
                              "Room No.",
                            style: AppTextTheme.labelStyle,
                          ),
                          const SizedBox(width: 10,),
                          DropdownButton(
                            value: selectedRoom,
                            onChanged: (String? newValue) {
                              setState(() {
                                selectedRoom = newValue;
                              });
                            },
                            items:(selectedBlock=='A'? roomOptionsA: roomOptionsB)
                              .map((String block) {
                                return DropdownMenuItem(
                                  value: block,
                                  child: Text(block),
                                );
                            }).toList(),
                          ),
                          const SizedBox(width: 10,)

                        ],
                      ),
                    ),
                  ],
                ),
                // Register Button.
                const SizedBox(height: 25,),
                CustomButton(
                    buttonText: "Register",
                    buttonColor: AppColors.light,
                    onTap: () {
                      if(formKey.currentState!.validate()) {
                        Get.to(const HomeScreen());
                      }
                    }
                ),
                const SizedBox(height: 7,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Already have an account? ",
                      style: AppTextTheme.dmTextStyle,
                    ),
                    InkWell(
                      onTap: () {
                        Get.to(const LoginScreen());
                      },
                      child: Text(
                        "Click to Login",
                        style: AppTextTheme.dmTextStyle.copyWith(
                            color: AppColors.lightBlue
                        ),
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 50,)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
