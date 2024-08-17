import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:hostel_management/api_services/api_provider.dart';
import 'package:hostel_management/api_services/api_utils.dart';
import 'package:hostel_management/features/students/room_change_form_screen.dart';

import '../../common/app_bar.dart';
import '../../common/assets_path.dart';
import '../../models/RoomAvailabilityModel.dart';
import '../../theme/colors.dart';
import '../../theme/text_theme.dart';
import 'package:provider/provider.dart';

class RoomAvailableScreen extends StatefulWidget {
  const RoomAvailableScreen({super.key});

  @override
  State<RoomAvailableScreen> createState() => _RoomAvailableScreenState();
}

class _RoomAvailableScreenState extends State<RoomAvailableScreen> {

  List<RoomAvailabilityModel>? roomAvailabilityModel;

  Future<void> fetchRoomAvailability() async {
    try {
      final apiProvider = Provider.of<ApiProvider>(context, listen: false);
      final roomAvailability = await apiProvider.getResponse(ApiUtils.roomAvailability);

      if(roomAvailability.statusCode== 200) {
        roomAvailabilityModel = roomAvailabilityModelFromJson(roomAvailability.body);
      }
    } catch(e) {
      print("Error: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context, "Rooms Available", false),
      body: FutureBuilder(
        future: fetchRoomAvailability(),
        builder: (context, snapshot) {
          if(snapshot.hasError) {
            return Center(
              child: Text("Error: ${snapshot.error}", style: AppTextTheme.appBarStyle,),
            );
          } else if(snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return roomAvailabilityModel==null?
                Center(child: Text("No Rooms Avaliable", style: AppTextTheme.appBarStyle,),) :
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 15),
                  child: ListView.builder(
                    shrinkWrap: true,
                      itemCount: roomAvailabilityModel!.length,
                      itemBuilder: (context, index) {
                        return RoomCard(
                          room: roomAvailabilityModel![index],
                        );
                      }
                  ),
                );
          }
      })
    );
  }
}

class RoomCard extends StatelessWidget {
  final RoomAvailabilityModel room;
  const RoomCard({super.key, required this.room});

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
          color: AppColors.primaryColor,
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
                "Room No.: ${room.roomNumber}",
                style: AppTextTheme.labelStyle,
              )
            ],
          ),
          const SizedBox(width: 5,),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Block: ${room.blockNumber}",
                style: AppTextTheme.labelStyle,
              ),
              const SizedBox(height: 5,),
              Text(
                "Capacity: ${room.roomCapacity}",
                style: AppTextTheme.labelStyle,
              ),
              const SizedBox(height: 5,),
              Text(
                "Current Capacity: ${room.roomCurrentCapacity}",
                style: AppTextTheme.labelStyle,
              ),
              const SizedBox(height: 5,),
              Text(
                "Room Type: ${room.roomType}",
                style: AppTextTheme.labelStyle,
              ),
              const SizedBox(height: 7,),
              Row(
                children: [
                  Text(
                    "Status: ",
                    style: AppTextTheme.labelStyle,
                  ),
                  const SizedBox(width: 4,),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 3),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(7),
                      color: Colors.greenAccent[700]
                    ),
                    child: InkWell(
                      onTap: () {
                        if(room.roomCapacity != room.roomCurrentCapacity) {
                          Navigator.push(context, MaterialPageRoute(builder: (
                              _) => RoomChangeFormScreen(
                            requestedBlock: room.blockNumber.toString(),
                            requestedRoom: room.roomNumber.toString(),
                          )));
                        }
                      },
                      child: Text(
                        room.roomStatus.toString(),
                        style: AppTextTheme.primaryStyle.copyWith(
                          color: Colors.white
                        ),
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
