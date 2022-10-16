// import 'dart:convert';
//
// import 'package:http/http.dart' as http;
// import 'package:ecommerce_project_api/api/api_settings.dart';
// import 'package:ecommerce_project_api/models/user.dart';
//
// class UserApiController {
//   Future<List<User>> read() async {
//     Uri uri = Uri.parse(ApiSettings.users);
//     var response = await http.get(uri);
//
//     if (response.statusCode == 200) {
//       var jsonResponse = jsonDecode(response.body);
//       var jsonArray = jsonResponse['data'] as List;
//       return jsonArray.map((jsonObject) => User.fromJson(jsonObject)).toList();
//     }
//     return [];
//   }
// }
