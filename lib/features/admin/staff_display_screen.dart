import 'package:flutter/material.dart';
import 'package:hostel_management/common/app_bar.dart';
import 'package:hostel_management/common/assets_path.dart';
import 'package:hostel_management/theme/text_theme.dart';

import '../../theme/colors.dart';

class StaffDisplayScreen extends StatefulWidget {
  const StaffDisplayScreen({super.key});

  @override
  State<StaffDisplayScreen> createState() => _StaffDisplayScreenState();
}

class _StaffDisplayScreenState extends State<StaffDisplayScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context, "Staff Members", false),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 1,
              childAspectRatio: 2/1.2,
              crossAxisSpacing: 18,
              mainAxisSpacing: 18,
            ),
            itemCount: 1,
            itemBuilder: (context, index) {
              return Container(
                padding: const EdgeInsets.all(18),
                decoration: const ShapeDecoration(
                  shape: RoundedRectangleBorder(
                    side: BorderSide(
                      color: AppColors.greenColor,
                      width: 2
                    ),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                      bottomLeft: Radius.circular(30),
                    )
                  )
                ),
                child: Column(
                  children: [
                    Expanded(
                      child: Row(
                        children: [
                          Column(
                            children: [
                              Image.asset(
                                  ImagePaths.staffMembers,
                                width: 90,
                                height: 90,
                              ),
                              const SizedBox(height: 20,),
                              Text(
                                  "Hostel Warden",
                                style: AppTextTheme.labelStyle.copyWith(fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          const SizedBox(width: 20,),
                          Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(height: 10,),
                                Text(
                                  "Name: Professor X",
                                  style: AppTextTheme.primaryStyle,
                                ),
                                const SizedBox(height: 10,),
                                Text(
                                  "Email: abc@gmail.com",
                                  style: AppTextTheme.primaryStyle,
                                ),
                                const SizedBox(height: 10,),
                                Text(
                                  "Contact No.: 0000000000",
                                  style: AppTextTheme.primaryStyle,
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    InkWell(
                      onTap: () {

                      },
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          color: Colors.red[400],
                          borderRadius: BorderRadius.circular(10)
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                                "Delete Staff",
                              style: AppTextTheme.labelStyle.copyWith(color: Colors.white),
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              );
            }
        ),
      ),
    );
  }
}
