import 'dart:io';

import 'package:ecommerce_project_api/models/api_response.dart';
import 'package:ecommerce_project_api/pref/shared_pref_controller.dart';


mixin ApiHelper {
  Uri getUrl(String url) {
    return Uri.parse(url);
  }

  ApiResponse get failedResponse =>
      ApiResponse(message: 'Something went wrong', success: false);

  Map<String, String> get headers {
    return {
      HttpHeaders.authorizationHeader: SharedPrefController().token,
      // HttpHeaders.acceptHeader: 'application/json',
      'Accept': 'application/json',
      'X-Requested-With': 'XMLHttpRequest',
    };
  }

  bool isSuccessRequest(int statusCode) {
    return statusCode < 400;
  }


}
