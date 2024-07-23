import 'package:flutter/material.dart';

import '../../common/app_bar.dart';
import '../../common/assets_path.dart';
import '../../theme/colors.dart';
import '../../theme/text_theme.dart';

class RoomAvailableScreen extends StatefulWidget {
  const RoomAvailableScreen({super.key});

  @override
  State<RoomAvailableScreen> createState() => _RoomAvailableScreenState();
}

class _RoomAvailableScreenState extends State<RoomAvailableScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context, "Rooms Available", false),
      body: Column(
        children: [
          const SizedBox(height: 20,),
          ListView.builder(
            itemCount: 2,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return const RoomCard();
            }
          ),
        ],
      ),
    );
  }
}

class RoomCard extends StatelessWidget {
  const RoomCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(18),
      margin: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
          bottomLeft: Radius.circular(30),
        ),
        border: Border.all(
          color: AppColors.greenColor,
          width: 2,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Column(
            children: [
              Image.asset(
                  ImagePaths.roomAvailable,
                height: 90,
                width: 90,
              ),
              Text(
                "Room No.: 101",
                style: AppTextTheme.labelStyle,
              )
            ],
          ),
          const SizedBox(width: 20,),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Block: A",
                style: AppTextTheme.labelStyle,
              ),
              const SizedBox(height: 5,),
              Text(
                "Capacity: ",
                style: AppTextTheme.labelStyle,
              ),
              const SizedBox(height: 5,),
              Text(
                "Current Capacity",
                style: AppTextTheme.labelStyle,
              ),
              const SizedBox(height: 5,),
              Text(
                "Room Type",
                style: AppTextTheme.labelStyle,
              ),
              const SizedBox(height: 7,),
              Row(
                children: [
                  Text(
                    "Status: ",
                    style: AppTextTheme.labelStyle,
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 3),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(7),
                      color: Colors.greenAccent[700]
                    ),
                    child: Text(
                      "Available",
                      style: AppTextTheme.primaryStyle.copyWith(
                        color: Colors.white
                      ),
                    ),
                  )
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
