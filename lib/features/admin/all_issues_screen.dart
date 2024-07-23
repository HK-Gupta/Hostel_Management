import 'package:flutter/material.dart';
import 'package:hostel_management/common/app_bar.dart';
import 'package:hostel_management/common/assets_path.dart';
import 'package:hostel_management/theme/text_theme.dart';

class AllIssuesScreen extends StatefulWidget {
  const AllIssuesScreen({super.key});

  @override
  State<AllIssuesScreen> createState() => _AllIssuesScreenState();
}

class _AllIssuesScreenState extends State<AllIssuesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context, "All Issues", false),
      body: ListView.builder(
        itemCount: 4,
          itemBuilder:(context, index) {
            return const IssueCard();
          }
      ),
    );
  }
}

class IssueCard  extends StatelessWidget {
  const IssueCard ({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 15, right: 15),
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
                  const Color(0xff2e8b57).withOpacity(0.5),
                  const Color(0x002e8857) ,
                ]
              )
            ),
            child: Row(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    const SizedBox(height: 10,),
                    Image.asset(
                      ImagePaths.person,
                      height: 70,
                      width: 70,
                    ),
                    const SizedBox(height: 10,),
                    Text(
                      "User Name",
                      style: AppTextTheme.socialTextStyle.copyWith(
                        fontWeight: FontWeight.bold
                      ),
                    )
                  ],
                ),
                const SizedBox(width: 20,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 10,),
                    Text(
                      "User Name: Xyz",
                      style: AppTextTheme.primaryStyle
                      ),
                    const SizedBox(height: 10,),
                    Text(
                        "Room Number: 201",
                        style: AppTextTheme.primaryStyle
                    ),
                    const SizedBox(height: 10,),
                    Text(
                        "Email: abc@gmail.com",
                        style: AppTextTheme.primaryStyle
                    ),
                    const SizedBox(height: 10,),
                    Text(
                        "Phone No.: 1234567890",
                        style: AppTextTheme.primaryStyle
                    ),
                    const SizedBox(height: 10,)
                  ],
                )
              ],
            )
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
                      Column(
                        children: [
                          Row(
                            children: [
                              Text(
                                "Issue: ",
                                style: AppTextTheme.socialTextStyle.copyWith(
                                    fontWeight: FontWeight.w700
                                ),
                              ),
                              Text(
                                "Bathroom",
                                style: AppTextTheme.labelStyle,
                              )
                            ],
                          ),
                          const SizedBox(height: 4,),
                          Row(
                            children: [
                              Text(
                                "Student Comment: ",
                                style: AppTextTheme.socialTextStyle.copyWith(
                                    fontWeight: FontWeight.w700
                                ),
                              ),
                              Text(
                                "'Leakage'",
                                style: AppTextTheme.labelStyle,
                              )
                            ],
                          ),
                          const SizedBox(height: 20,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              InkWell(
                                onTap: () {

                                },
                                child: Container(
                                  padding: const EdgeInsets.all(10),
                                  width: MediaQuery.of(context).size.width/2.5,
                                  decoration: BoxDecoration(
                                      color: Colors.blue[400],
                                      borderRadius: BorderRadius.circular(10)
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        "Resolved",
                                        style: AppTextTheme.labelStyle.copyWith(color: Colors.white),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          )
                        ],
                      )
                    ],
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

