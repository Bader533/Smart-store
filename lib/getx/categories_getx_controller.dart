import 'dart:developer';

import 'package:ecommerce_project_api/api/controllers/category_api_controller.dart';
import 'package:ecommerce_project_api/models/category.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategoryGetxController extends GetxController {
  final CategoryApiController categoryApiController = CategoryApiController();
  RxList<Category> categories = <Category>[].obs;

  // RxList<SubCategory> subCategories = <SubCategory>[].obs;

  static CategoryGetxController get to => Get.find();

  void onInit() {
    getCities();
    super.onInit();
  }

  Future<void> getCities() async {
    categories.value = await categoryApiController.read();
    update();
  }

// Future<void> getSubCategories({required int id}) async {
//   subCategories.value = await categoryApiController.getSubCategory(id: id);
//   update();
// }
}
