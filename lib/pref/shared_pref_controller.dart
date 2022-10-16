import 'package:ecommerce_project_api/models/user.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum PrefKeys {
  id,
  fullName,
  email,
  gender,
  mobile,
  token,
  refreshToken,
  isLoggedIn,
  lang
}

class SharedPrefController {
  static SharedPrefController? _instance;
  late SharedPreferences _sharedPreferences;

  SharedPrefController._();

  factory SharedPrefController() {
    return _instance ??= SharedPrefController._();
  }

  Future<void> initPreferences() async {
    _sharedPreferences = await SharedPreferences.getInstance();
  }

  //Save, clear, isLoggedIn, getByKey<T>, getToken
  Future<void> save({required User user}) async {
    await _sharedPreferences.setBool(PrefKeys.isLoggedIn.name, true);
    await _sharedPreferences.setInt(PrefKeys.id.name, user.id);
    await _sharedPreferences.setString(PrefKeys.fullName.name, user.name);
    await _sharedPreferences.setString(PrefKeys.mobile.name, user.mobile);
    await _sharedPreferences.setString(PrefKeys.gender.name, user.gender);
    await _sharedPreferences.setString(
        PrefKeys.token.name, 'Bearer ${user.token}');
    await _sharedPreferences.setString(
        PrefKeys.refreshToken.name, 'Bearer ${user.refreshToken}');
  }

  Future<bool> clear() async => _sharedPreferences.clear();

  Future<bool> changeLanguage({required String language}) async {
    return _sharedPreferences.setString(PrefKeys.lang.name, language);
  }

  bool get loggedIn =>
      _sharedPreferences.getBool(PrefKeys.isLoggedIn.name) ?? false;

  T? getByKey<T>({required String key}) {
    if (_sharedPreferences.containsKey(key)) {
      return _sharedPreferences.get(key) as T;
    }
    return null;
  }

  String get token => _sharedPreferences.getString(PrefKeys.token.name) ?? '';
}
