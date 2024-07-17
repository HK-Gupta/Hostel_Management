import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:hostel_management/common/app_bar.dart';
import 'package:hostel_management/common/custom_text_field.dart';
import 'package:hostel_management/theme/colors.dart';
import 'package:hostel_management/theme/text_theme.dart';
import 'package:hostel_management/widgets/custom_button.dart';
import 'package:hostel_management/widgets/custom_text.dart';

class CreateIssueScreen extends StatefulWidget {
  const CreateIssueScreen({super.key});

  @override
  State<CreateIssueScreen> createState() => _CreateIssueScreenState();
}

class _CreateIssueScreenState extends State<CreateIssueScreen> {
  TextEditingController commentController = TextEditingController();

  String? selectedIssue;
  List<String> allIssues = [
    "Bedroom",
    "Bathroom",
    "Water",
    "Kitchen",
    "Furniture",
    "Light",
    "others"
  ];
  static final formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    super.dispose();
    commentController.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context, "Create Issue", false),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
        child: Form(
          key: formKey,
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Room
                Text("Room Number", style: AppTextTheme.labelStyle,),
                const CustomText(text: "101"),
                // Block
                const SizedBox(height: 15,),
                Text("Block Number", style: AppTextTheme.labelStyle,),
                const CustomText(text: "B"),
                // Email ID
                const SizedBox(height: 15,),
                Text("Your Email Id", style: AppTextTheme.labelStyle,),
                const CustomText(text: "abc@gmail.com"),
                // Phone Number
                const SizedBox(height: 15,),
                Text("Phone Number", style: AppTextTheme.labelStyle,),
                const CustomText(text: "0123456789"),
                // Facing Issue
                const SizedBox(height: 15,),
                Text("Issue you are Facing", style: AppTextTheme.labelStyle,),
                Container(
                  margin: const EdgeInsets.only(top: 4),
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  width: MediaQuery.of(context).size.width,
                  decoration: ShapeDecoration(
                    shape: RoundedRectangleBorder(
                      side: const BorderSide(
                        width: 1,
                        color: AppColors.greenColor,
                      ),
                      borderRadius: BorderRadius.circular(14),
                    ),
                  ),
                  child: DropdownButton(
                    underline: const SizedBox(),
                    isExpanded: true,
                      items: allIssues.map((String issue) {
                        return DropdownMenuItem(
                          value: issue,
                          child: Text(
                             issue, style: AppTextTheme.socialTextStyle,
                          ),
                        );
                      }).toList(),
                      value: selectedIssue,
                      onChanged: (String? newValue) {
                        setState(() {
                          selectedIssue = newValue;
                        });
                      },
                  ),
                ),
                // Comments
                const SizedBox(height: 15,),
                Text("Comments", style: AppTextTheme.labelStyle,),
                CustomTextField(
                  controller: commentController,
                  validator: (value) {
                    if(value!.isEmpty) {
                      return "Comment is required";
                    }
                    return null;
                  },
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: Color(0xFFD1D8FF)
                    ),
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                const SizedBox(height: 40,),
                CustomButton(
                    buttonText: "Submit",
                    onTap: () {

                    }
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
