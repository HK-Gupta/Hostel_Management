import 'package:flutter/material.dart';
import 'package:hostel_management/api_services/api_calls.dart';
import 'package:hostel_management/common/app_bar.dart';
import 'package:hostel_management/common/assets_path.dart';
import 'package:hostel_management/models/StaffModel.dart';
import 'package:hostel_management/theme/text_theme.dart';
import 'package:provider/provider.dart';
import '../../api_services/api_provider.dart';
import '../../api_services/api_utils.dart';
import '../../theme/colors.dart';

class StaffDisplayScreen extends StatefulWidget {
  const StaffDisplayScreen({super.key});

  @override
  State<StaffDisplayScreen> createState() => _StaffDisplayScreenState();
}

class _StaffDisplayScreenState extends State<StaffDisplayScreen> {

  List<StaffModel>? staffModel;

  Future<void> fetchStaffs() async {
    try {
      final apiProvider = Provider.of<ApiProvider>(context, listen: false);
      final totalStaffs = await apiProvider.getResponse(ApiUtils.createStaff);

      if(totalStaffs.statusCode== 200) {
        staffModel = staffModelFromJson(totalStaffs.body);
      }
    } catch(e) {
      print("Error: $e");
    }
  }

  bool isLoading = false;
  Future<void> deleteStaff(final staffs) async {
    setState(() {
      isLoading = true;
    });
    await ApiCalls().deleteFromDatabase(
        context,
        ApiUtils.createStaff,
        staffs.id.toString(),
        "Deleted Successfully"
    );
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context, "Staff Members", false),
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
      FutureBuilder(
        future: fetchStaffs(),
        builder: (context, snapshot) {
          if(snapshot.hasError) {
            return Center(child: Text("Error: ${snapshot.error}", style: AppTextTheme.appBarStyle,));
          } else if(snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else {
            return staffModel!.isEmpty ?
                Center(child:Text("No Staffs", style: AppTextTheme.appBarStyle,)):
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: GridView.builder(
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 1,
                        childAspectRatio: 2/1.2,
                        crossAxisSpacing: 18,
                        mainAxisSpacing: 18,
                      ),
                      itemCount: staffModel!.length,
                      itemBuilder: (context, index) {
                        final staffs = staffModel![index];
                        return Container(
                          padding: const EdgeInsets.all(18),
                          decoration: const ShapeDecoration(
                              shape: RoundedRectangleBorder(
                                  side: BorderSide(
                                      color: AppColors.primaryColor,
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
                                        const SizedBox(height: 10,),
                                        Text(
                                          staffs.jobRole.toString(),
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
                                            "Name: ${staffs.firstName} ${staffs.lastName}",
                                            style: AppTextTheme.primaryStyle,
                                          ),
                                          const SizedBox(height: 10,),
                                          Text(
                                            maxLines: 2,
                                            "Email: ${staffs.email}",
                                            style: AppTextTheme.primaryStyle,
                                          ),
                                          const SizedBox(height: 10,),
                                          Text(
                                            "Contact No.: ${staffs.phoneNo}",
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
                                  child: isLoading? const Center(child: CircularProgressIndicator()):
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      InkWell(
                                        onTap: () {
                                          deleteStaff(staffs);
                                        },
                                        child: Text(
                                          "Delete Staff",
                                          style: AppTextTheme.labelStyle.copyWith(color: Colors.white),
                                        ),
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
            );
          }
        },
      )
    );
  }
}
