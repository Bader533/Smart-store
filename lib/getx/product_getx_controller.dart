import 'package:ecommerce_project_api/api/controllers/product_api_controller.dart';
import 'package:ecommerce_project_api/models/product_details.dart';
import 'package:get/get.dart';

class ProductGetxController extends GetxController {
  final ProductApiController productApiController = ProductApiController();
  RxList<ProductDetails> products = <ProductDetails>[].obs;
  RxList<ProductDetails> favoriteProducts = <ProductDetails>[].obs;
  Rx<ProductDetails?> productDetails = ProductDetails().obs;
  RxBool loading = false.obs;
//
  static ProductGetxController get to => Get.find();
//
//   // Future<void> getProduct({required int id}) async {
//   //   loading.value = true;
//   //   products.value = await productApiController.getProduct(id: id);
//   //   loading.value = false;
//   //   update();
//   // }
//
//   // Future<void> getFavoriteProducts() async {
//   //   loading.value = true;
//   //   favoriteProducts.value = await productApiController.getFavoriteProducts();
//   //   loading.value = false;
//   //   update();
//   // }
//   //
//   // void onInit() {
//   //   super.onInit();
//   //   getFavoriteProducts();
//   // }
//
  Future<void> getProductDetails({required int id}) async {
    loading.value = true;
    productDetails.value = (await productApiController.getProductDetails(id: id)) as ProductDetails?;
    loading.value = false;
    productDetails.refresh();
    products.refresh();
    favoriteProducts.refresh();
    update();
  }
//
//   // Future<void> addFavoriteProducts(
//   //     {required ProductDetails product, required BuildContext context}) async {
//   //   bool status =
//   //       await productApiController.addFavoriteProducts(context, id: product.id);
//   //   if (status) {
//   //     int index = products.indexWhere((element) => element.id == product.id);
//   //     products[index].isFavorite == false
//   //         ? favoriteProducts.add(product)
//   //         : favoriteProducts
//   //             .removeWhere((element) => element.id == products[index].id);
//   //     products[index].isFavorite = !products[index].isFavorite;
//   //     productDetails.value!.isFavorite = products[index].isFavorite;
//   //   }
//   //   productDetails.refresh();
//   //   products.refresh();
//   //   favoriteProducts.refresh();
//   //   update();
//   // }
//
//   // Future<void> rattingProduct(
//   //     {required ProductDetails product,
//   //     required BuildContext context,
//   //     required double rate}) async {
//   //   bool status = await productApiController.productRate(context,
//   //       id: product.id, ratting: rate);
//   //   if (status) {
//   //     int index = products.indexWhere((element) => element.id == product.id);
//   //     products[index].productRate = rate;
//   //   }
//   //   productDetails.refresh();
//   //   products.refresh();
//   //   favoriteProducts.refresh();
//   //   update();
//   // }
}
