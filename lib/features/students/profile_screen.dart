import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hostel_management/api_services/api_calls.dart';
import 'package:hostel_management/api_services/api_utils.dart';
import 'package:hostel_management/common/custom_text_field.dart';
import 'package:hostel_management/common/my_form_field.dart';
import 'package:hostel_management/features/auth/screens/login_screen.dart';
import 'package:hostel_management/widgets/custom_button.dart';
import '../../common/assets_path.dart';
import '../../theme/colors.dart';
import '../../theme/text_theme.dart';
import '../../widgets/custom_text.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.appBarColor,
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
              ApiCalls().handleLogout(context);
              Get.to(const LoginScreen());
            },
            child: Container(
              padding: EdgeInsets.only(left: 8, right: 6, top: 6, bottom: 6),
              margin: EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                color: Colors.redAccent,
                borderRadius: BorderRadius.circular(100),
              ),
              child: Icon(
                Icons.logout,
                size: 25,
                color: Colors.white,
              ),
            ),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: ApiUtils.authority=='0'
            ? Column(
                children: [
                  Center(
                    child: Image.asset(
                      ImagePaths.person,
                      width: w/2.8,
                    ),
                  ),
                  const SizedBox(height: 10,),
                  Text(
                    "You are an Admin",
                    style: AppTextTheme.appBarStyle,
                  ),
                ],
            )
            : SingleChildScrollView(
              child: Column(
                children: [
                  Center(
                    child: Image.asset(
                      ImagePaths.person,
                      width: w/2.8,
                    ),
                  ),
                  const SizedBox(height: 10,),
                  Text(
                    "${ApiUtils.firstName} ${ApiUtils.lastName}",
                    style: AppTextTheme.appBarStyle,
                  ),
                  const SizedBox(height: 20,),
                  Row(
                    children: [
                      Expanded(child: CustomText(text: "Room No - ${ApiUtils.roomNo}")),
                      const SizedBox(width: 25,),
                      Expanded(child: CustomText(text: "Block No - ${ApiUtils.blockNo}")),
                    ],
                  ),
                  const SizedBox(height: 15,),
                  CustomText(text: ApiUtils.email,),
                  const SizedBox(height: 15,),
                  CustomTextField(
                    controller: nameController,
                    inputHint: ApiUtils.userName,
                    prefixIcon: const Icon(Icons.person_outline),
                  ),
                  const SizedBox(height: 15,),
                  CustomTextField(
                    controller: phoneController,
                    inputHint: ApiUtils.phoneNo,
                    prefixIcon: const Icon(Icons.phone_outlined),
                  ),
                  const SizedBox(height: 15,),
                  Row(
                    children: [
                      Expanded(
                        child: CustomTextField(
                          controller: firstNameController,
                          inputHint: ApiUtils.firstName,
                        ),
                      ),
                      const SizedBox(width: 20,),
                      Expanded(
                        child: CustomTextField(
                          controller: lastNameController,
                          inputHint: ApiUtils.lastName,
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 40,),
                  CustomButton(
                      buttonText: "Save",
                      onTap: () {}
                  )
                ],
                      ),
            ),
      ),
    );
  }
}
