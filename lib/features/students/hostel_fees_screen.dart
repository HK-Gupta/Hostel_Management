import 'package:flutter/material.dart';
import 'package:hostel_management/common/app_bar.dart';
import 'package:hostel_management/theme/colors.dart';
import 'package:hostel_management/theme/text_theme.dart';

import '../../common/assets_path.dart';

class HostelFeesScreen extends StatefulWidget {
  const HostelFeesScreen({super.key});

  @override
  State<HostelFeesScreen> createState() => _HostelFeesScreenState();
}

class _HostelFeesScreenState extends State<HostelFeesScreen> {
  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: buildAppBar(context, "Hostel Fee", false),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
              ImagePaths.hostelPath,
            width: w/2.1,
            height: w/2.1,
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            width: w,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              border: Border.all(
                color: AppColors.greenColor,
                width: 2
              ),
              color: Colors.greenAccent[100]
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 10,),
                const Text(
                  "Hostel Details",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold
                  ),
                ),
                const SizedBox(height: 10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Block No.: A",
                      style: AppTextTheme.labelStyle,
                    ),
                    Text(
                      "Room No.: 110",
                      style: AppTextTheme.labelStyle,
                    ),
                  ],
                ),
                const SizedBox(height: 20,),
                const Text(
                  "Payment Details",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold
                  ),
                ),
                const SizedBox(height: 15,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Maintenance charge:",
                      style: AppTextTheme.labelStyle.copyWith(
                        fontWeight: FontWeight.bold
                      ),
                    ),
                    Text(
                      "₹ 1000",
                      style: AppTextTheme.labelStyle,
                    ),
                  ],
                ),
                const SizedBox(height: 15,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Parking charge:",
                      style: AppTextTheme.labelStyle.copyWith(
                          fontWeight: FontWeight.bold
                      ),
                    ),
                    Text(
                      "₹ 500",
                      style: AppTextTheme.labelStyle,
                    ),
                  ],
                ),
                const SizedBox(height: 15,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Room Water charge:",
                      style: AppTextTheme.labelStyle.copyWith(
                          fontWeight: FontWeight.bold
                      ),
                    ),
                    Text(
                      "₹ 500",
                      style: AppTextTheme.labelStyle,
                    ),
                  ],
                ),
                const SizedBox(height: 15,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Room charge:",
                      style: AppTextTheme.labelStyle.copyWith(
                          fontWeight: FontWeight.bold
                      ),
                    ),
                    Text(
                      "₹ 4000",
                      style: AppTextTheme.labelStyle,
                    ),
                  ],
                ),
                const SizedBox(height: 20,),
                const Divider(
                  color: Colors.black,
                ),
                const SizedBox(height: 20,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Total Amount:",
                      style: AppTextTheme.labelStyle.copyWith(
                          fontWeight: FontWeight.bold
                      ),
                    ),
                    Text(
                      "₹ 6000",
                      style: AppTextTheme.labelStyle,
                    ),
                  ],
                ),
                const SizedBox(height: 15,),
              ],
            )
          )
        ],
      ),
    );
  }
}
