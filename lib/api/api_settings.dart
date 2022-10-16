class ApiSettings {
  static const String _baseUrl = 'https://smart-store.mr-dev.tech/api/';
  static const String register = '${_baseUrl}auth/register';
  static const String login = '${_baseUrl}auth/login';
  static const String logout = '${_baseUrl}auth/logout';
  static const String forgetPassword = '${_baseUrl}auth/forget-password';
  static const String resetPassword = '${_baseUrl}auth/reset-password';
  static const String home = '${_baseUrl}home';
  static const String city = '${_baseUrl}cities';
  static const String activateAccount ="${_baseUrl}auth/activate";

  //products
  static const String category= '${_baseUrl}categories';
  static const String product = '${_baseUrl}sub-categories';
  static const String productDetails = '${_baseUrl}products';
  static const String favoriteProduct = '${_baseUrl}favorite-products';



}