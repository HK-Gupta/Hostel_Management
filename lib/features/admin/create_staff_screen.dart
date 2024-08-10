import 'package:flutter/material.dart';
import 'package:hostel_management/api_services/api_calls.dart';
import 'package:hostel_management/api_services/api_utils.dart';
import 'package:hostel_management/common/app_bar.dart';

import '../../common/assets_path.dart';
import '../../common/custom_text_field.dart';
import '../../theme/colors.dart';
import '../../theme/text_theme.dart';
import '../../widgets/custom_button.dart';
import '../home/screens/home_screen.dart';
import 'package:get/get.dart';

class CreateStaffScreen extends StatefulWidget {
  const CreateStaffScreen({super.key});

  @override
  State<CreateStaffScreen> createState() => _CreateStaffScreenState();
}

class _CreateStaffScreenState extends State<CreateStaffScreen> {
  static final formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController userNameController = TextEditingController();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController jobRoleController = TextEditingController();
  ApiCalls apiCalls = ApiCalls();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose;
    userNameController.dispose;
    firstNameController.dispose;
    lastNameController.dispose;
    phoneNumberController.dispose;
    jobRoleController.dispose;
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context, "Create Staff", false),
      body: ApiUtils.authority!='0'?
      Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            "You Don't have permission to view this page",
            style: AppTextTheme.socialTextStyle,
            textAlign: TextAlign.center,
          ),
        ),
      ):
      Form(
        key: formKey,
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
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
              // Job Role.
              const SizedBox(height: 7,),
              Text(
                "Job Role",
                style: AppTextTheme.labelStyle,
              ),
              CustomTextField(
                controller: jobRoleController,
                enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: AppColors.greyDk),
                    borderRadius: BorderRadius.circular(15)
                ),
                inputHint: "Enter the Job Role",
                validator: (value) {
                  if(value!.isEmpty) {
                    return 'Job Role is required';
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
                  } else if(!emailRegex.hasMatch(value)) {
                    return 'Enter a valid Email';
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
              // Register Button.
              const SizedBox(height: 25,),
              CustomButton(
                  buttonText: "Create Staff",
                  buttonColor: AppColors.light,
                  onTap: () {
                    if(formKey.currentState!.validate()) {
                      apiCalls.createStaff(
                        context,
                        userNameController.text,
                        firstNameController.text,
                        lastNameController.text,
                        jobRoleController.text,
                        phoneNumberController.text,
                        emailController.text,
                        passwordController.text
                      );
                    }
                  }
              ),
              const SizedBox(height: 50,)
            ],
          ),
        ),
      ),
    );
  }


  final emailRegex = RegExp(r'^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)*(\.[a-z]{2,})$');
}
