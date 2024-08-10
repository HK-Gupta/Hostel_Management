import 'package:flutter/material.dart';
import 'package:hostel_management/api_services/api_calls.dart';
import 'package:hostel_management/common/app_bar.dart';
import 'package:hostel_management/common/assets_path.dart';
import 'package:hostel_management/models/IssueModel.dart';
import 'package:hostel_management/theme/text_theme.dart';
import 'package:provider/provider.dart';

import '../../api_services/api_provider.dart';
import '../../api_services/api_utils.dart';

class AllIssuesScreen extends StatefulWidget {
  const AllIssuesScreen({super.key});

  @override
  State<AllIssuesScreen> createState() => _AllIssuesScreenState();
}

class _AllIssuesScreenState extends State<AllIssuesScreen> {

  List<IssueModel>? issueModel;

  Future<void> fetchIssues() async {
    try {
      final apiProvider = Provider.of<ApiProvider>(context, listen: false);
      final totalIssues = await apiProvider.getResponse(ApiUtils.createIssues);

      if(totalIssues.statusCode== 200) {
        issueModel = issueModelFromJson(totalIssues.body);
      }
    } catch(e) {
      print("Error: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context, "All Issues", false),
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
      ):
      FutureBuilder(
        future: fetchIssues(),
        builder: (context, snapshot) {
          if(snapshot.hasError) {
            return Center(
                child: Text("Error; ${snapshot.error}", style: AppTextTheme.appBarStyle,)
            );
          } else if(snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return issueModel == null ?
                Center(child: Text("No Issues", style: AppTextTheme.appBarStyle,),) :
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                  child: ListView.builder(
                    itemCount: issueModel!.length,
                    itemBuilder:(context, index) {
                      return IssueCard(
                        issue: issueModel![index],
                      );
                    }
                  ),
                );

          }
        },

      ),
    );
  }
}

class IssueCard  extends StatelessWidget {
  final IssueModel issue;
  const IssueCard ({super.key, required this.issue});

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
                      "${issue.firstName} ${issue.lastName}",
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
                      "User Name: ${issue.userName}",
                      style: AppTextTheme.primaryStyle
                      ),
                    const SizedBox(height: 10,),
                    Text(
                        "Room Number: ${issue.roomNumber}",
                        style: AppTextTheme.primaryStyle
                    ),
                    const SizedBox(height: 10,),
                    Text(
                        "Email: ${issue.email}",
                        style: AppTextTheme.primaryStyle
                    ),
                    const SizedBox(height: 10,),
                    Text(
                        "Phone No.: ${issue.phoneNo}",
                        style: AppTextTheme.primaryStyle
                    ),
                  ],
                )
              ],
            )
          ),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
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
                            issue.issue.toString(),
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
                            "'${issue.comment}'",
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
                                  InkWell(
                                    onTap: () {
                                      ApiCalls().deleteFromDatabase(
                                          context,
                                          ApiUtils.createIssues,
                                          issue.id.toString(),
                                          "Issue Resolved"
                                      );
                                    },
                                    child: Text(
                                      "Resolved",
                                      style: AppTextTheme.labelStyle.copyWith(color: Colors.white),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
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

