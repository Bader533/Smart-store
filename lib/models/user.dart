import 'package:ecommerce_project_api/models/city.dart';

class User {
  late int id;
  late String name;
  late String? email;
  late String mobile;
  late String gender;
  late bool active;
  late bool verified;
  late String cityId;
  late String storeId;
  late String? fcmToken;
  late String token;
  late String tokenType;
  late String refreshToken;
  late City city;
  late String password;
  User();

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    mobile = json['mobile'];
    gender = json['gender'];
    active = json['active'];
    verified = json['verified'];
    cityId = json['city_id'];
    storeId = json['store_id'];
    fcmToken = json['fcm_token'];
    token = json['token'];
    tokenType = json['token_type'];
    refreshToken = json['refresh_token'];
    // city = json['city'] != null ?  City.fromJson(json['city']) : null;
  }
}