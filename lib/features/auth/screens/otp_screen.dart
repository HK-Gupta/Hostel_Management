import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hostel_management/api_services/api_calls.dart';
import 'package:hostel_management/common/app_bar.dart';
import 'package:hostel_management/theme/text_theme.dart';
import 'package:hostel_management/widgets/custom_button.dart';

class OtpScreen extends StatefulWidget {
  final String email;
  const OtpScreen({super.key, required this.email});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  static final formKey = GlobalKey<FormState>();
  final List<TextEditingController> controllers = List.generate(6, (_) => TextEditingController());
  final List<FocusNode> focusNodes = List.generate(6, (_) => FocusNode());
  final List<bool> isValid = List.generate(6, (_) => true);

  @override
  void dispose() {
    for (var controller in controllers) {
      controller.dispose();
    }
    for (var focusNode in focusNodes) {
      focusNode.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context, "OTP Verification", false),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Verification",
                style: AppTextTheme.appBarStyle,
              ),
              const SizedBox(height: 4,),
              Text(
                "A 6-digit PIN has been sent to your email address. Please enter the PIN below to complete your registration.",
                style: AppTextTheme.primaryStyle,
              ),
              const SizedBox(height: 40),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: List.generate(6, (index) {
                  return otpInputBox(
                    context,
                    controllers[index],
                    focusNodes[index],
                    index,
                  );
                }),
              ),
              const SizedBox(height: 50),
              CustomButton(
                buttonText: "Continue",
                onTap: () {
                  if (formKey.currentState!.validate()) {
                    String otp = controllers.map((c) => c.text).join();
                    ApiCalls().verifyOtp(context, widget.email, otp);
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget otpInputBox(BuildContext context, TextEditingController controller, FocusNode focusNode, int index) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 2, vertical: 10),
      width: MediaQuery.of(context).size.width / 7.7,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: isValid[index] ? Colors.black : Colors.red,
          width: 1.5,
        ),
      ),
      child: TextFormField(
        focusNode: focusNode,
        textAlign: TextAlign.center,
        maxLength: 1,
        decoration: InputDecoration(
          counterText: "",
          border: InputBorder.none,
        ),
        controller: controller,
        style: const TextStyle(fontSize: 28),
        keyboardType: TextInputType.number,
        validator: (value) {
          if (value!.isEmpty) {
            setState(() {
              isValid[index] = false;
            });
            return null;
          }
          setState(() {
            isValid[index] = true;
          });
          return null;
        },
        onChanged: (value) {
          if (value.length >= 1) {
            FocusScope.of(context).nextFocus();
          }
        },
        onFieldSubmitted: (_) {
          setState(() {
            isValid[index] = controller.text.isNotEmpty;
          });
        },
      ),
    );
  }
}
