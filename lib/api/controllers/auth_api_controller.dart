import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:ecommerce_project_api/api/api_helper.dart';
import 'package:ecommerce_project_api/api/api_settings.dart';
import 'package:ecommerce_project_api/models/api_response.dart';
import 'package:ecommerce_project_api/models/user.dart';
import 'package:ecommerce_project_api/pref/shared_pref_controller.dart';

class AuthApiController with ApiHelper {
  Future<ApiResponse> register({required User user}) async {
    Uri uri = Uri.parse(ApiSettings.register);
    var response = await http.post(uri, body: {
      'name': user.name,
      'mobile': user.mobile,
      'password': user.password,
      'gender': user.gender,
      'city_id':user.cityId,
      'STORE_API_KEY': '5db2a859-a07f-49a3-8041-9e20c756d423',
    },headers:headers);

    if (response.statusCode == 201 || response.statusCode == 400) {
      var jsonResponse = jsonDecode(response.body);
      return ApiResponse(
          message: jsonResponse['message'], success: jsonResponse['status']);
    }
    return failedResponse;
  }

  Future<ApiResponse> login(
      {required String mobile, required String password}) async {
    Uri uri = Uri.parse(ApiSettings.login);
    var response = await http.post(uri, headers: headers,body: {
      'mobile': mobile,
      'password': password,
    });

    if (response.statusCode == 200 || response.statusCode == 400) {
      var jsonResponse = jsonDecode(response.body) as Map<String, dynamic>;
      print(jsonResponse);
      if (response.statusCode == 200) {
        var jsonObject = jsonResponse['data'];
        User user = User.fromJson(jsonObject);
        SharedPrefController().save(user: user);
      }
      return ApiResponse(
        message: jsonResponse['message'],
        success: jsonResponse['status'],
      );
    }
    return failedResponse;
  }

  Future<ApiResponse> logout() async {
    Uri uri = Uri.parse(ApiSettings.logout);
    var response = await http.get(uri, headers: headers);
    if (response.statusCode == 200 || response.statusCode == 401) {
      await SharedPrefController().clear();
      // if(response.statusCode == 200) {
      //   var jsonResponse = jsonDecode(response.body);
      //   return ApiResponse(message: jsonResponse['message'], success: jsonResponse['status']);
      // }else {
      //   return const ApiResponse(message: 'Logged out successfully', success: true);
      // }
      var jsonResponse = jsonDecode(response.body);
      return ApiResponse(
        message: response.statusCode == 200
            ? jsonResponse['message']
            : 'Logged out successfully',
        success: true,
      );
    }
    return failedResponse;
  }

  //Forget Password - Reset Password
  Future<ApiResponse> forgotPassword({required String mobile}) async {
    Uri uri = Uri.parse(ApiSettings.forgetPassword);
    var response = await http.post(uri, body: {'mobile': mobile});
    if (response.statusCode == 200 || response.statusCode == 400) {
      var jsonResponse = jsonDecode(response.body);
      print('Code: ${jsonResponse['code']}');
      return ApiResponse(
          message: jsonResponse['message'], success: jsonResponse['status']);
    }
    return failedResponse;
  }

  Future<ApiResponse> resetPassword(
      {required String mobile,
      required String code,
      required String password}) async {
    Uri uri = Uri.parse(ApiSettings.resetPassword);
    var response = await http.post(uri, body: {
      'mobile': mobile,
      'code': code,
      'password': password,
      'password_confirmation': password,
    });

    if (response.statusCode == 200 || response.statusCode == 400) {
      var jsonResponse = jsonDecode(response.body);
      return ApiResponse(
          message: jsonResponse['message'], success: jsonResponse['status']);
    }
    return failedResponse;
  }

  Future<bool> activateAccount(BuildContext context,
      {required String mobile, required String code}) async {
    var response = await http.post(getUrl(ApiSettings.activateAccount),
        body: {
          'mobile': mobile,
          'code': code,
        },
        headers: headers);
    if (isSuccessRequest(response.statusCode)) {

      return true;
    } else if (response.statusCode != 500) {
      // showMessage(context, response, error: true);
    } else {
      // handleServerError(context);
    }
    return false;
  }
}
