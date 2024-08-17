import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hostel_management/api_services/api_provider.dart';
import 'package:hostel_management/api_services/api_utils.dart';
import 'package:hostel_management/features/auth/screens/login_screen.dart';
import 'package:hostel_management/features/home/screens/home_screen.dart';
import 'package:hostel_management/models/UserResponse.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../features/auth/screens/otp_screen.dart';

class ApiCalls {
  Future<void> handleLogin(
      BuildContext context, String email, String password) async {
    final apiProvider = Provider.of<ApiProvider>(context, listen: false);
    final Map<String, dynamic> requestData = {
      "email": email,
      "password": password
    };
    final response = await apiProvider.postResponse(ApiUtils.login,
        headers: {'Content-Type': 'application/json'}, body: requestData);
    print("Status: ${response.statusCode}");

    final Map<String, dynamic> responseBody = json.decode(response.body);
    if (response.statusCode == 200) {
      ApiUtils.showSuccessSnackBar(context, "Logged in Successfully");
      final UserResponse userResponse = UserResponse.fromJson(responseBody);

      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('id', userResponse.id ?? '');
      await prefs.setString('authority', userResponse.authority ?? '');
      await prefs.setString('userName', userResponse.userName ?? '');
      await prefs.setString('firstName', userResponse.firstName ?? '');
      await prefs.setString('lastName', userResponse.lastName ?? '');
      await prefs.setString('email', userResponse.email ?? '');
      await prefs.setString('password', userResponse.password ?? '');
      await prefs.setString('phoneNo', userResponse.phoneNo ?? '');
      await prefs.setString('blockNo', userResponse.blockNo ?? '');
      await prefs.setString('roomNo', userResponse.roomNo ?? '');

      // Load user details
      await ApiUtils.loadUserDetails();

      Navigator.pushReplacement(context, MaterialPageRoute(builder: (_)=> const HomeScreen()));
    }
    else {
      print("Failed to login");
      ApiUtils.showErrorSnackBar(context, "Failed to login: ${responseBody['message']}");
    }
  }

  Future<String?> registerStudent(
      BuildContext context,
      String userName,
      String firstName,
      String lastName,
      String phoneNo,
      String email,
      String password,
      String blockNo,
      String roomNo,
      ) async {
    final apiProvider = Provider.of<ApiProvider>(context, listen: false);
    final Map<String, dynamic> requestData = {
      "authority": "1",
      "userName": userName,
      "firstName": firstName,
      "lastName": lastName,
      "phoneNo": phoneNo,
      "email": email,
      "password": password,
      "blockNumber": blockNo,
      "roomNumber": roomNo,
    };

    final response = await apiProvider.postResponse(ApiUtils.register,
        headers: {'Content-Type': 'application/json'}, body: requestData);
    print("Status: ${response.statusCode}");

    final Map<String, dynamic> responseBody = json.decode(response.body);
    if (response.statusCode == 200 || response.statusCode == 201) {
      ApiUtils.showSuccessSnackBar(
          context, "User Created Successfully. Please enter the OTP to verify your account.");

      // Navigate to OTP Screen
      final String? otp = await Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => OtpScreen(email: email,), // Ensure this screen is correctly implemented
        ),
      );

      if (otp != null && otp.isNotEmpty) {
        // Verify the OTP
        await verifyOtp(context, email, otp);
      }
    } else {
      print("Failed to register");
      ApiUtils.showErrorSnackBar(
          context, "Failed to register: ${responseBody['message']}");
    }
    return null;
  }

// Function to verify OTP
  Future<void> verifyOtp(BuildContext context, String email, String otp) async {
    final apiProvider = Provider.of<ApiProvider>(context, listen: false);

    final verifyResponse = await apiProvider.postResponse(
      ApiUtils.verifyOTP, // Ensure this is the correct endpoint for OTP verification
      headers: {'Content-Type': 'application/json'},
      body: {
        "email": email,
        "otp": otp,
      },
    );

    if (verifyResponse.statusCode == 200) {
      ApiUtils.showSuccessSnackBar(context, "Account verified successfully.");
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (_) => const LoginScreen()));
    } else {
      ApiUtils.showErrorSnackBar(
          context, "OTP verification failed: ${json.decode(verifyResponse.body)['message']}");
    }
  }


  Future<String?> createStaff(
      BuildContext context,
      String userName,
      String firstName,
      String lastName,
      String jobRole,
      String phoneNo,
      String email,
      String password,
      ) async {
    final apiProvider = Provider.of<ApiProvider>(context, listen: false);
    final Map<String, dynamic> requestData = {
      "authority": "2",
      "userName": userName,
      "firstName": firstName,
      "lastName": lastName,
      "jobRole": jobRole,
      "phoneNo": phoneNo,
      "email": email,
      "password": password,
    };
    final response = await apiProvider.postResponse(ApiUtils.createStaff ,
        headers: {'Content-Type': 'application/json'}, body: requestData);
    print("Status: ${response.statusCode}");

    final Map<String, dynamic> responseBody = json.decode(response.body);
    if(response.statusCode == 201) {
      ApiUtils.showSuccessSnackBar(context, "Staff Created Successfully");
      Navigator.pop(context);
    }
    else {
      print("Failed to Create Staff");
      ApiUtils.showErrorSnackBar(context, "Failed to Create Staff: ${responseBody['message']}");
    }
    return null;
  }


  Future<String?> createIssues(
      BuildContext context,
      String roomNumber,
      String blockNumber,
      String userName,
      String firstName,
      String lastName,
      String email,
      String phoneNo,
      String issue,
      String comment
      ) async {
    final apiProvider = Provider.of<ApiProvider>(context, listen: false);
    final Map<String, dynamic> requestData = {
      "roomNumber": roomNumber,
      "blockNumber": blockNumber,
      "userName": userName,
      "firstName": firstName,
      "lastName": lastName,
      "email": email,
      "phoneNo": phoneNo,
      "issue": issue,
      "comment": comment
    };
    final response = await apiProvider.postResponse(ApiUtils.createIssues ,
        headers: {'Content-Type': 'application/json'}, body: requestData);
    print("Status: ${response.statusCode}");

    final Map<String, dynamic> responseBody = json.decode(response.body);
    if(response.statusCode == 201) {
      ApiUtils.showSuccessSnackBar(context, "Issue Created Successfully");
      Navigator.pop(context);
    }
    else {
      print("Failed to Create Issue");
      ApiUtils.showErrorSnackBar(context, "${responseBody['message']}");
    }
    return null;
  }


  Future<String?> createRoomChangeRequest(
      BuildContext context,
      String currentRoomNumber,
      String changeRoomNumber,
      String currentBlock,
      String changeBlock,
      String studentEmailId,
      String changeReason
      ) async {
    final apiProvider = Provider.of<ApiProvider>(context, listen: false);
    final Map<String, dynamic> requestData = {
      "currentRoomNumber": currentRoomNumber,
      "changeRoomNumber": changeRoomNumber,
      "currentBlock": currentBlock,
      "changeBlock": changeBlock,
      "studentEmailId": studentEmailId,
      "changeReason": changeReason
    };
    final response = await apiProvider.postResponse(ApiUtils.changeRequest ,
        headers: {'Content-Type': 'application/json'}, body: requestData);
    print("Status: ${response.statusCode}");

    final Map<String, dynamic> responseBody = json.decode(response.body);
    if(response.statusCode == 201) {
      ApiUtils.showSuccessSnackBar(context, "Request Created Successfully");
      Navigator.pop(context);
    }
    else {
      print("Unable to send Request");
      ApiUtils.showErrorSnackBar(context, "Unable to send Request: ${responseBody['message']}");
    }
    return null;
  }

  Future<String?> deleteFromDatabase(BuildContext context, String api, String id, String message) async{
    print("Id: $id");
    final apiProvider = Provider.of<ApiProvider>(context, listen: false);
    final response = await apiProvider.deleteResponse(
      "$api/$id",
      headers: {
        'Content-Type': 'application/json',
      },
    );

    final Map<String, dynamic> responseBody = json.decode(response.body);
    if(response.statusCode == 200) {
      ApiUtils.showSuccessSnackBar(context, "$message");
      Navigator.pop(context);
    }
    else {
      print("Failed to Delete: ${responseBody['id']}");
      ApiUtils.showErrorSnackBar(context, "${responseBody['message']}");
    }
    return null;
  }

  Future<void> handleLogout(BuildContext context) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.clear();

    // Clear ApiUtils
    ApiUtils.id = "";
    ApiUtils.authority = "";
    ApiUtils.userName = "";
    ApiUtils.firstName = "";
    ApiUtils.lastName = "";
    ApiUtils.email = "";
    ApiUtils.password = "";
    ApiUtils.phoneNo = "";
    ApiUtils.blockNo = "";
    ApiUtils.roomNo = "";

    Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => const LoginScreen()));
  }
}
