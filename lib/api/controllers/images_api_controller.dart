// import 'dart:convert';
// import 'dart:io';
//
// import 'package:get/get.dart';
// import 'package:http/http.dart' as http;
// import 'package:ecommerce_project_api/api/api_helper.dart';
// import 'package:ecommerce_project_api/api/api_settings.dart';
// import 'package:ecommerce_project_api/models/api_response.dart';
// import 'package:ecommerce_project_api/models/student_image.dart';
// import 'package:ecommerce_project_api/pref/shared_pref_controller.dart';
//
// class ImagesApiController with ApiHelper {
//   //Upload - {Read - Delete}
//
//   Future<ApiResponse<StudentImage>> upload({required String path}) async {
//     //FORM DATA - MULTI PART REQUEST
//     Uri uri = Uri.parse(ApiSettings.images.replaceFirst('/{id}', ''));
//     var request = http.MultipartRequest('POST', uri);
//     var file = await http.MultipartFile.fromPath('image', path);
//     request.files.add(file);
//     // request.fields['KEY'] = 'VALUE';
//     request.headers[HttpHeaders.authorizationHeader] = SharedPrefController().token;
//     request.headers[HttpHeaders.acceptHeader] = 'application/json';
//     var response = await request.send();
//
//     if (response.statusCode == 201 || response.statusCode == 400) {
//       var body = await response.stream.transform(utf8.decoder).first;
//       var jsonResponse = jsonDecode(body);
//       var apiResponse = ApiResponse<StudentImage>(
//         message: jsonResponse['message'],
//         success: jsonResponse['status'],
//       );
//       if (response.statusCode == 201) {
//         var image = StudentImage.fromJson(jsonResponse['object']);
//         apiResponse.object = image;
//       }
//       return apiResponse;
//     }
//     return ApiResponse<StudentImage>(
//       message: 'Something went wrong',
//       success: false,
//     );
//   }
//
//   Future<List<StudentImage>> readImages() async {
//     print('readImages');
//     Uri uri = Uri.parse(ApiSettings.images.replaceFirst('/{id}', ''));
//     var response = await http.get(uri, headers: headers);
//     if (response.statusCode == 200) {
//       var jsonResponse = jsonDecode(response.body);
//       var jsonArray = jsonResponse['data'] as List;
//       return jsonArray
//           .map((jsonObject) => StudentImage.fromJson(jsonObject))
//           .toList();
//     }
//     return [];
//   }
//
//   Future<ApiResponse> deleteImage({required int id}) async {
//     Uri uri = Uri.parse(ApiSettings.images.replaceFirst('{id}', id.toString()));
//     var response = await http.delete(uri, headers: headers);
//     if (response.statusCode == 200) {
//       var jsonResponse = jsonDecode(response.body);
//       return ApiResponse(
//           message: jsonResponse['message'], success: jsonResponse['status']);
//     }
//     return failedResponse;
//   }
// }
