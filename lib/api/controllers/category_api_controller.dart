import 'dart:convert';
import 'package:ecommerce_project_api/api/api_helper.dart';
import 'package:ecommerce_project_api/api/api_settings.dart';
import 'package:ecommerce_project_api/models/category.dart';
import 'package:http/http.dart' as http;

class CategoryApiController with ApiHelper {
  Future<List<Category>> read() async {
    var response = await http.get(getUrl(ApiSettings.category),headers: headers);
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body)['list'] as List;
      List<Category> categories = data.map((jsonObject) => Category.fromJson(jsonObject)).toList();
      return categories;
    }
    return [];
  }
}
