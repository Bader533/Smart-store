import 'package:ecommerce_project_api/api/controllers/city_api_controller.dart';
import 'package:ecommerce_project_api/models/city.dart';

import 'package:get/get.dart';

class CityGetxController extends GetxController {
  final CityApiController citiesApiController = CityApiController();
  RxList<City> cities = <City>[].obs;

  static CityApiController get to => Get.find();

  void onInit() {
    getCities();
    super.onInit();
  }

  Future<void> getCities() async {
    cities.value = await citiesApiController.getCities();
    update();
  }

  String getCityNameById({required int id}) {
    int index = cities.indexWhere((element) => element.id == id);
    String cityName = cities[index].nameEn;
    return cityName;
  }
}
