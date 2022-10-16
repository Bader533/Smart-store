// import 'package:get/get.dart';
// import 'package:ecommerce_project_api/api/controllers/home_api_controller.dart';
// import 'package:ecommerce_project_api/models/Home.dart';
//
// // class HomeGetxController extends GetxController {
// //   // RxBool loading = false.obs;
// //   final HomeApiController homeApiController = HomeApiController();
// //   //RxList<Category> categories = <Category>[].obs;
// //   HomeModel? homeModel;
// //
// //
// //   static HomeApiController get to => Get.find();
// //
// //   void onInit() {
// //     getHome();
// //     super.onInit();
// //   }
// //
// //   Future<void> getHome() async {
// //     // loading.value = true;
// //     HomeModel? model = (await homeApiController.getHome()) as HomeModel?;
// //     this.homeModel = model;
// //     // log('homeApiController');
// //     // log(model!.message);
// //     // update();
// //     // loading.value = true;
// //
// //   }
// //
// //
// //
// // }
//
// class HomeGetxController extends GetxController {
//   bool loading = false;
//   HomeModel? home;
//   final HomeApiController _apiController = HomeApiController();
//
//   static HomeGetxController get to => Get.find<HomeGetxController>();
//
//   @override
//   void onInit() {
//     // TODO: implement onInit
//     getHome();
//     super.onInit();
//   }
//
//   void getHome() async {
//     loading = true;
//     home = await _apiController.getHome();
//     loading = false;
//   }
// }
