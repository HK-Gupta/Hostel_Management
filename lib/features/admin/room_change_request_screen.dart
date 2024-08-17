import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:hostel_management/api_services/api_calls.dart';
import 'package:hostel_management/api_services/api_utils.dart';
import 'package:hostel_management/models/ChangeRoomModel.dart';
import 'package:hostel_management/theme/colors.dart';
import 'package:provider/provider.dart';
import '../../api_services/api_provider.dart';
import '../../common/app_bar.dart';
import '../../common/assets_path.dart';
import '../../theme/text_theme.dart';

class RoomChangeRequestScreen extends StatefulWidget {
  const RoomChangeRequestScreen({super.key});

  @override
  State<RoomChangeRequestScreen> createState() => _RoomChangeRequestScreenState();
}

class _RoomChangeRequestScreenState extends State<RoomChangeRequestScreen> {
  List<ChangeRoomModel>? changeRoomModel;
  bool isLoading = false;
  Future<void> roomChangeRequest(final changeRoomModel, String message) async {
    setState(() {
      isLoading = true;
    });
    await ApiCalls().deleteFromDatabase(
        context,
        ApiUtils.changeRequest,
        changeRoomModel.id ?? 'N/A',
        message
    );
    setState(() {
      isLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    fetchIssues().then((_) {
      setState(() {}); // Refresh the UI after data is fetched
    });
  }

  Future<void> fetchIssues() async {
    try {
      final apiProvider = Provider.of<ApiProvider>(context, listen: false);
      final totalRequest = await apiProvider.getResponse(ApiUtils.changeRequest);

      if (totalRequest.statusCode == 200) {
        changeRoomModel = changeRoomModelFromJson(totalRequest.body);

        // Loop through each request and fetch the student details using the email
        for (var issue in changeRoomModel!) {
          final studentEmail = issue.studentEmailId;
          if (studentEmail != null) {
            final userResponse = await apiProvider.getResponse(
              '${ApiUtils.studentSearch}?email=$studentEmail',
            );

            if (userResponse.statusCode == 200) {
              final studentData = jsonDecode(userResponse.body);
              // Attach this data to your ChangeRoomModel or manage it elsewhere
              issue.studentData = studentData;
            }
          }
        }
      } else {
        print("Error: ${totalRequest.statusCode} ${totalRequest.body}");
      }
    } catch (e) {
      print("Error: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context, "All Requests", false),
      body: ApiUtils.authority != '0'
          ? Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            "You Don't have permission to view this page",
            style: AppTextTheme.socialTextStyle,
            textAlign: TextAlign.center,
          ),
        ),
      )
          : changeRoomModel == null
          ? const Center(
        child: CircularProgressIndicator(),
      )
          : changeRoomModel!.isEmpty
          ? Center(
        child: Text(
          "No requests found",
          style: AppTextTheme.primaryStyle,
        ),
      )
          : ListView.builder(
        itemCount: changeRoomModel?.length ?? 0,
        itemBuilder: (context, index) {
          return RequestCard(
              changeRoomModel: changeRoomModel![index],
            isLoading: isLoading,
            roomChangeRequest: roomChangeRequest,
          );
        },
      ),
    );
  }
}

class RequestCard extends StatelessWidget {
  final ChangeRoomModel changeRoomModel;
  final bool isLoading;
  final Future<void> Function(ChangeRoomModel changeRoomModel, String message) roomChangeRequest;

  const RequestCard({super.key, required this.changeRoomModel, required this.isLoading, required this.roomChangeRequest});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 15, right: 15),
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: [
          const SizedBox(height: 20),
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
              ),
              gradient: LinearGradient(
                begin: const Alignment(0, -1),
                end: const Alignment(0, 1),
                colors: [
                  AppColors.lightBlue.withOpacity(0.5),
                  AppColors.lightBlue.withOpacity(0.01),
                ],
              ),
            ),
            child: Row(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    const SizedBox(height: 10),
                    Image.asset(
                      ImagePaths.person,
                      height: 70,
                      width: 70,
                    ),
                    const SizedBox(height: 10),
                    Text(
                      changeRoomModel.studentData?['userName'] ?? "User Name",
                      style: AppTextTheme.socialTextStyle.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                const SizedBox(width: 20),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 10),
                    Text(
                      "User Name: ${changeRoomModel.studentData?['userName'] ?? 'N/A'}",
                      style: AppTextTheme.primaryStyle,
                    ),
                    const SizedBox(height: 7),
                    Text(
                      "Current Block: ${changeRoomModel.currentBlock ?? 'N/A'}",
                      style: AppTextTheme.primaryStyle,
                    ),
                    const SizedBox(height: 7),
                    Text(
                      "Current Room Number: ${changeRoomModel.currentRoomNumber ?? 'N/A'}",
                      style: AppTextTheme.primaryStyle,
                    ),
                    const SizedBox(height: 7),
                    Text(
                      "Email: ${changeRoomModel.studentEmailId ?? 'N/A'}",
                      style: AppTextTheme.primaryStyle,
                    ),
                    const SizedBox(height: 7),
                    Text(
                      "Phone No.: ${changeRoomModel.studentData?['phoneNo'] ?? 'N/A'}",
                      style: AppTextTheme.primaryStyle,
                    ),
                    const SizedBox(height: 10),
                  ],
                ),
              ],
            ),
          ),
          Container(
            height: 150,
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Column(
              children: [
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Text(
                              "Asked For: ",
                              style: AppTextTheme.socialTextStyle.copyWith(
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            const SizedBox(width: 10),
                            Text(
                              "Block: ${changeRoomModel.changeBlock ?? 'N/A'}",
                              style: const TextStyle(
                                fontSize: 18,
                                color: Colors.red,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            const SizedBox(width: 20),
                            Text(
                              "Room: ${changeRoomModel.changeRoomNumber ?? 'N/A'}",
                              style: const TextStyle(
                                fontSize: 18,
                                color: Colors.red,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 4),
                        Row(
                          children: [
                            Text(
                              "Reason: ",
                              style: AppTextTheme.socialTextStyle.copyWith(
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            Text(
                              changeRoomModel.changeReason ?? "No reason provided",
                              style: AppTextTheme.labelStyle,
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),
                        isLoading? const Center(child: CircularProgressIndicator()):
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Material(
                              borderRadius: BorderRadius.circular(10),
                              elevation: 4,
                              child: Container(
                                padding: const EdgeInsets.all(10),
                                width: MediaQuery.of(context).size.width / 3,
                                decoration: BoxDecoration(
                                  color: Colors.red[400],
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Center(
                                  child: InkWell(
                                    onTap: () {
                                      roomChangeRequest(changeRoomModel, "Request Rejected");
                                    },
                                    child: Text(
                                      "Reject",
                                      style: AppTextTheme.labelStyle.copyWith(
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Material(
                              borderRadius: BorderRadius.circular(10),
                              elevation: 4,
                              child: Container(
                                padding: const EdgeInsets.all(10),
                                width: MediaQuery.of(context).size.width / 3,
                                decoration: BoxDecoration(
                                  color: Colors.green[400],
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: InkWell(
                                  onTap: () {
                                    roomChangeRequest(changeRoomModel, "Request Accepted");
                                  },
                                  child: Center(
                                    child: Text(
                                      "Approve",
                                      style: AppTextTheme.labelStyle.copyWith(
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
