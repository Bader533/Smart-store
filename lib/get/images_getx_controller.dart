  // import 'package:get/get_state_manager/get_state_manager.dart';
  // import 'package:get/instance_manager.dart';
  // import 'package:get/state_manager.dart';
  // import 'package:ecommerce_project_api/api/controllers/images_api_controller.dart';
  // import 'package:ecommerce_project_api/models/api_response.dart';
  // import 'package:ecommerce_project_api/models/student_image.dart';
  //
  // class ImagesGetxController extends GetxController {
  //   RxBool loading = false.obs;
  //   RxList<StudentImage> images = <StudentImage>[].obs;
  //   final ImagesApiController _apiController = ImagesApiController();
  //
  //   static ImagesGetxController get to => Get.find<ImagesGetxController>();
  //
  //   @override
  //   void onInit() {
  //     // TODO: implement onInit
  //     readImages();
  //     super.onInit();
  //   }
  //
  //   Future<ApiResponse<StudentImage>> upload({required String path}) async {
  //     ApiResponse<StudentImage> apiResponse = await _apiController.upload(path: path);
  //     if (apiResponse.success && apiResponse.object != null){
  //       images.add(apiResponse.object!);
  //     }
  //     return apiResponse;
  //   }
  //
  //   void readImages() async {
  //     loading.value = true;
  //     images.value = await _apiController.readImages();
  //     loading.value = false;
  //   }
  //
  //   Future<ApiResponse> deleteImage({required int index}) async {
  //     ApiResponse apiResponse =
  //         await _apiController.deleteImage(id: images[index].id);
  //     if (apiResponse.success) {
  //       images.removeAt(index);
  //     }
  //     return apiResponse;
  //   }
  //
  // //UPLOAD Function
  // }
