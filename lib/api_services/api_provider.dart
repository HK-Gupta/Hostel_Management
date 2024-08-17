import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class ApiProvider extends ChangeNotifier{
  final String baseUrl;
  final http.Client httpClient;

  ApiProvider({
    required this.baseUrl,
    required this.httpClient
  });

  Future<http.Response> postResponse(String endPoint, {
    Map<String, String>? headers,
    Map<String, dynamic>? body,
  }) async {
     final Uri uri = Uri.parse("$baseUrl$endPoint");
     final Map<String, String> headers= {
       'Content-Type': 'application/json',
     };

     final String jsonBody = body!=null? json.encode(body): '';
     final response = await httpClient.post(uri, headers: headers, body: jsonBody);
     print("Request: ${response.body}");

     return response;
  }

  Future<http.Response> getResponse(String endPoint, {
    Map<String, String>? headers,
  }) async {
    final Uri uri = Uri.parse("$baseUrl$endPoint");
    final Map<String, String> headers= {
      'Content-Type': 'application/json',
    };

    final response = await httpClient.get(uri, headers: headers);
    print("Request: ${response.body}");

    return response;
  }

  Future<http.Response> deleteResponse(String endPoint, {
    Map<String, String>? headers,
    Map<String, dynamic>? body,
  }) async {
    final Uri uri = Uri.parse("$baseUrl$endPoint");
    final Map<String, String> headers = {
      'Content-Type': 'application/json',
    };

    final String jsonBody = body != null ? json.encode(body) : '';
    final response = await httpClient.delete(uri, headers: headers, body: jsonBody);
    print("Delete Request: ${response.body}");

    return response;
  }
}