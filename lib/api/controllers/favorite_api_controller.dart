import 'dart:convert';
import 'package:ecommerce_project_api/api/api_helper.dart';
import 'package:ecommerce_project_api/models/favorite_products.dart';
import 'package:http/http.dart' as http;
import '../api_settings.dart';

class FavoriteApiController with ApiHelper {
  Future<bool> addFavorite({required int product_id}) async {
    // var response = await http.post(getUrl(ApiSettings.favoriteProduct),
    //   body: {'product_id': product_id.toString()},headers: headers,);
    Uri uri = Uri.parse(ApiSettings.favoriteProduct);
    var response = await http.post(uri,
        body: {
          'product_id': product_id.toString(),
        },
        headers: headers);

    if (isSuccessRequest(response.statusCode)) {
      // showMessage(context, response);
      return true;
    } else if (response.statusCode != 500) {
      // showS(context, response, error: true);\
      print('done');
    } else {
      // handleServerError(context);
      print('error');
    }
    return false;
  }

  Future<List<FavoriteProducts>> getFavoriteProducts() async {
    var response =
        await http.get(getUrl(ApiSettings.favoriteProduct), headers: headers);
    if (isSuccessRequest(response.statusCode)) {
      var data = jsonDecode(response.body)['list'] as List;
      print(data);
      // List<FavoriteProducts> favoriteProducts =data.map((e) => FavoriteProducts.fromJson(e)).toList();
      List<FavoriteProducts> favoriteProducts = data.map((jsonObject) => FavoriteProducts.fromJson(jsonObject)).toList();

      return favoriteProducts;
    }
    return [];
  }
}
