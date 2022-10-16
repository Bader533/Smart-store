import 'dart:convert';
import 'package:ecommerce_project_api/api/api_helper.dart';
import 'package:ecommerce_project_api/models/product.dart';
import '../api_settings.dart';
import 'package:http/http.dart' as http;

class ProductApiController with ApiHelper {
  Future<List<Product>> getProduct({required int id}) async {
    var response =
        await http.get(getUrl('${ApiSettings.product}/$id'), headers: headers);
    if (isSuccessRequest(response.statusCode)) {
      var data = jsonDecode(response.body)['list'] as List;
      List<Product> products = data.map((e) => Product.fromJson(e)).toList();
      return products;
    }
    return [];
  }

  Future<Product?> getProductDetails({required int id}) async {
    var response = await http.get(getUrl('${ApiSettings.productDetails}/$id'),
        headers: headers);
    if (isSuccessRequest(response.statusCode)) {
      var data = jsonDecode(response.body)['object'];
      var productDetails = Product.fromJson(data);
      return productDetails;
    }
    return null;
  }

  // Future<List<Product>> getFavoriteProducts() async {
  //   var response =
  //       await http.get(getUrl(ApiSettings.favoriteProduct), headers: headers);
  //   if (isSuccessRequest(response.statusCode)) {
  //     // var data = jsonDecode(response.body);
  //     var data = jsonDecode(response.body)['list'] as List;
  //
  //     List<Product> favoriteProducts =
  //         data.map((e) => Product.fromJson(e)).toList();
  //     // print( favoriteProducts.first);
  //
  //     return favoriteProducts;
  //
  //   }
  //   return [];
  // }

//
// Future<bool> addFavoriteProducts(BuildContext context, {required int id}) async {
//   var response = await http.post(
//       getUrl(ApiSettings.FAVORITE_PRODUCT),
//       body: {'product_id': id.toString()},
//       headers: requestHeaders
//   );
//   if (isSuccessRequest(response.statusCode)) {
//     showMessage(context, response);
//     return true;
//   } else if (response.statusCode != 500) {
//     showMessage(context, response, error: true);
//   }else{
//     handleServerError(context);
//   }
//   return false;
// }

// Future<bool> productRate(BuildContext context, {required int id,required double ratting}) async {
//   var response = await http.post(
//       getUrl(ApiSettings.RATTING_PRODUCT),
//       body: {'product_id': id.toString(), 'rate' :ratting.toString()},
//       headers: requestHeaders
//   );
//   if (isSuccessRequest(response.statusCode)) {
//     showMessage(context, response);
//     return true;
//   } else if (response.statusCode != 500) {
//     showMessage(context, response, error: true);
//   }else{
//     handleServerError(context);
//   }
//   return false;
// }
}
