import 'package:flutter/material.dart';

import '../../common/app_bar.dart';
import '../../common/assets_path.dart';
import '../../theme/text_theme.dart';

class RoomChangeRequestScreen extends StatefulWidget {
  const RoomChangeRequestScreen({super.key});

  @override
  State<RoomChangeRequestScreen> createState() => _RoomChangeRequestScreenState();
}

class _RoomChangeRequestScreenState extends State<RoomChangeRequestScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context, "All Requests", false),
      body: ListView.builder(
          itemCount: 4,
          itemBuilder:(context, index) {
            return const RequestCard();
          }
      ),
    );
  }
}

class RequestCard extends StatelessWidget {
  const RequestCard({super.key});

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
                      const SizedBox(height: 7,),
                      Text(
                          "Current Block: A",
                          style: AppTextTheme.primaryStyle
                      ),
                      const SizedBox(height: 7,),
                      Text(
                          "Current Room Number: 201",
                          style: AppTextTheme.primaryStyle
                      ),
                      const SizedBox(height: 7,),
                      Text(
                          "Email: abc@gmail.com",
                          style: AppTextTheme.primaryStyle
                      ),
                      const SizedBox(height: 7,),
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
                            Column(
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      "Asked For: ",
                                      style: AppTextTheme.socialTextStyle.copyWith(
                                          fontWeight: FontWeight.w700
                                      ),
                                    ),
                                    const SizedBox(width: 10,),
                                    const Text(
                                      "Block: A",
                                      style: TextStyle(
                                        fontSize: 18,
                                        color: Colors.red,
                                        fontWeight: FontWeight.w500
                                      ),
                                    ),
                                    const SizedBox(width: 20,),
                                    const Text(
                                      "Room: 101",
                                      style: TextStyle(
                                        fontSize: 18,
                                        color: Colors.red,
                                        fontWeight: FontWeight.w500
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 4,),
                                Row(
                                  children: [
                                    Text(
                                      "Reason: ",
                                      style: AppTextTheme.socialTextStyle.copyWith(
                                          fontWeight: FontWeight.w700
                                      ),
                                    ),
                                    Text(
                                      "Fans are not working",
                                      style: AppTextTheme.labelStyle,
                                    )
                                  ],
                                ),
                                const SizedBox(height: 20,),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    InkWell(
                                      onTap: () {

                                      },
                                      child: Material(
                                        borderRadius: BorderRadius.circular(10),
                                        elevation: 4,
                                        child: Container(
                                          padding: const EdgeInsets.all(10),
                                          width: MediaQuery.of(context).size.width/3,
                                          decoration: BoxDecoration(
                                              color: Colors.red[400],
                                              borderRadius: BorderRadius.circular(10)
                                          ),
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            crossAxisAlignment: CrossAxisAlignment.center,
                                            children: [
                                              Text(
                                                "Reject",
                                                style: AppTextTheme.labelStyle.copyWith(color: Colors.white),
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                    InkWell(
                                      onTap: () {

                                      },
                                      child: Material(
                                        borderRadius: BorderRadius.circular(10),
                                        elevation: 4,
                                        child: Container(
                                          padding: const EdgeInsets.all(10),
                                          width: MediaQuery.of(context).size.width/3,
                                          decoration: BoxDecoration(
                                              color: Colors.green[400],
                                              borderRadius: BorderRadius.circular(10)
                                          ),
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            crossAxisAlignment: CrossAxisAlignment.center,
                                            children: [
                                              Text(
                                                "Approve",
                                                style: AppTextTheme.labelStyle.copyWith(color: Colors.white),
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                )
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

