import 'dart:convert';

import 'package:ecommerce_project_api/api/api_helper.dart';
import 'package:ecommerce_project_api/models/city.dart';

import '../api_settings.dart';
import 'package:http/http.dart' as http;

class CityApiController with ApiHelper {
  Future<List<City>> getCities() async {
    var response = await http.get(getUrl(ApiSettings.city), headers: headers);
    if (isSuccessRequest(response.statusCode)) {
      var data = jsonDecode(response.body)['list'] as List;
      List<City> cities = data.map((e) => City.fromJson(e)).toList();
      return cities;
    }
    return [];
  }
}
