import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hostel_management/common/app_bar.dart';
import 'package:hostel_management/common/assets_path.dart';
import 'package:hostel_management/features/admin/create_staff_screen.dart';
import 'package:hostel_management/features/students/create_issue_screen.dart';
import 'package:hostel_management/theme/colors.dart';
import 'package:hostel_management/widgets/category_card.dart';
import 'package:get/get.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context, "Dashboard", true),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Column(
            children: [
              const SizedBox(height: 10,),
              Container(
                height: 150,
                width: MediaQuery.of(context).size.width,
                decoration: const ShapeDecoration(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    side: BorderSide(
                      width: 2,
                      color:  AppColors.greenColor
                    ),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                      bottomLeft: Radius.circular(30),
                      bottomRight: Radius.circular(2)
                    ),
                  ),
                  shadows: [
                    BoxShadow(
                      color: Color(0x332e8b57),
                      blurRadius: 8,
                      offset: Offset(2, 4),
                      spreadRadius: 0
                    )
                  ]
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Harsh Kumar",
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                              color: Color(0xFF333333),
                              fontSize: 24
                            ),
                          ),
                          SizedBox(height: 15,),
                          Text(
                            "Room No.: 123",
                            style: TextStyle(
                                color:  Color(0xFF333333),
                                fontSize: 16
                            ),
                          ),
                          Text(
                            "Block No.: A",
                            style: TextStyle(
                              color:  Color(0xFF333333),
                              fontSize: 16
                            ),
                          ),
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            padding: const EdgeInsets.all(15),
                            decoration: BoxDecoration(
                              color: AppColors.greenColor,
                              borderRadius: BorderRadius.circular(100)
                            ),
                            child: const Icon(
                                Icons.note_add,
                              color: Colors.white,
                              size: 35,
                            ),
                          ),
                          const Text(
                              "Create Issue",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold
                            ),
                          )
                        ],
                      )
                    ]
                  ),
                )
              ),
              const SizedBox(height: 30,),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: const Color(0xFF262E8b57),
                ),
                padding: const EdgeInsets.all(15),
                width: MediaQuery.of(context).size.width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                        "Categories",
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 20,
                        color: Color(0xFF333333)
                      ),
                    ),
                    const SizedBox(height: 15,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        CategoryCard(
                            category: 'Room\nAvailability',
                            image: ImagePaths.roomAvailable,
                          onTap: () {},
                        ),
                        CategoryCard(
                            category: 'All\nIssue',
                            image: ImagePaths.allIssues,
                          onTap: () {
                              Get.to(const CreateIssueScreen());
                          },
                        ),
                        CategoryCard(
                            category: 'Staff\nMembers',
                            image: ImagePaths.staffMembers,
                          onTap: () {},
                        ),
                      ],
                    ),
                    const SizedBox(height: 15,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        CategoryCard(
                            category: 'Create\nStaff',
                            image: ImagePaths.createStaff,
                          onTap: () {
                              Get.to(const CreateStaffScreen());
                          },
                        ),
                        CategoryCard(
                            category: 'Hostel\nFees',
                            image: ImagePaths.hostelFees,
                          onTap: () {},
                        ),
                        CategoryCard(
                            category: 'Change\nRequests',
                            image: ImagePaths.changeRequest,
                          onTap: () {},
                        ),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
