import 'dart:convert';

import 'package:ecommerce_project_api/api/api_settings.dart';
import 'package:ecommerce_project_api/models/sub_category.dart';
import 'package:ecommerce_project_api/api/api_helper.dart';
import 'package:http/http.dart' as http;

class SubCategoryApiController with ApiHelper {


  Future<List<SubCategory>> getSubCategory({required int id}) async {
    var response = await http.get(getUrl(ApiSettings.category + '/$id'),headers: headers);
    if (isSuccessRequest(response.statusCode)) {
      var data = jsonDecode(response.body)['list'] as List;
      List<SubCategory> subCategories = data.map((e) => SubCategory.fromJson(e)).toList();
      return subCategories;
    }
    return [];
  }
}