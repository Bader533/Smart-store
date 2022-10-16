import 'package:get/get.dart';
import 'package:ecommerce_project_api/pref/shared_pref_controller.dart';

class LanguageGetxController extends GetxController {
  static LanguageGetxController get to => Get.find<LanguageGetxController>();

  String language =
      SharedPrefController().getByKey<String>(key: PrefKeys.lang.name) ?? 'en';

  void changeLanguage(String value) {
    language = value;
    // language = language == 'en' ? 'ar' : 'en';
    SharedPrefController().changeLanguage(language: language);
    update();
  }
}
