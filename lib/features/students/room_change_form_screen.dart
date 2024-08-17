import 'package:flutter/material.dart';
import 'package:hostel_management/api_services/api_calls.dart';
import 'package:hostel_management/api_services/api_utils.dart';
import 'package:hostel_management/common/app_bar.dart';
import 'package:hostel_management/common/custom_text_field.dart';
import 'package:hostel_management/widgets/custom_button.dart';

import '../../theme/text_theme.dart';
import '../../widgets/custom_text.dart';

class RoomChangeFormScreen extends StatefulWidget {
  final String requestedRoom;
  final String requestedBlock;
  const RoomChangeFormScreen({super.key, required this.requestedRoom, required this.requestedBlock});

  @override
  State<RoomChangeFormScreen> createState() => _RoomChangeFormScreenState();
}

class _RoomChangeFormScreenState extends State<RoomChangeFormScreen> {
  TextEditingController reasonController = TextEditingController();
  static final formKey = GlobalKey<FormState>();

  bool isLoading = false;
  Future<void> createRoomChangeRequest() async {
    setState(() {
      isLoading = true;
    });
    await ApiCalls().createRoomChangeRequest(
        context,
        ApiUtils.roomNo,
        widget.requestedRoom,
        ApiUtils.blockNo,
        widget.requestedBlock,
        ApiUtils.email,
        reasonController.text
    );
    setState(() {
      isLoading = false;
    });
  }

  @override
  void dispose() {
    reasonController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context, "Room Change Request", false),
      body: Form(
        key: formKey,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Current Block & Room No.", style: AppTextTheme.labelStyle,),
              Row(
                children: [
                  Flexible(child: CustomText(text: "Room No - ${ApiUtils.roomNo}")),
                  const SizedBox(width: 20,),
                  Flexible(child: CustomText(text: "Block No - ${ApiUtils.blockNo}")),
                ],
              ),
              const SizedBox(height: 20,),
              Text("Shift to  Block & Room No.", style: AppTextTheme.labelStyle,),
              Row(
                children: [
                  Flexible(child: CustomText(text: "Room No - ${widget.requestedRoom}")),
                  const SizedBox(width: 20,),
                  Flexible(child: CustomText(text: "Block No - ${widget.requestedBlock}")),
                ],
              ),
              const SizedBox(height: 20,),
              Text("Reason for change", style: AppTextTheme.labelStyle,),
              CustomTextField(
                controller: reasonController,
                inputHint: 'Enter the reason here',
                validator: (value) {
                  if(value!.isEmpty) {
                    return 'Valid reason is required';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 50,),
              isLoading? const Center(child: CircularProgressIndicator()):
              CustomButton(
                  buttonText: "Submit Request",
                  onTap: () {
                    if(formKey.currentState!.validate()) {
                      createRoomChangeRequest();
                    }
                  }
              )
            ],
          ),
        ),
      ),
    );
  }
}
