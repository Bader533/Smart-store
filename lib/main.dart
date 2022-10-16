import 'package:ecommerce_project_api/database/db_controller.dart';
import 'package:ecommerce_project_api/screens/app/bottom_navigation/bottom_navigation_screen.dart';
import 'package:ecommerce_project_api/screens/app/bottom_navigation/cart_screen.dart';
import 'package:ecommerce_project_api/screens/app/bottom_navigation/category_screen.dart';
import 'package:ecommerce_project_api/screens/app/bottom_navigation/home_screen.dart';
import 'package:ecommerce_project_api/screens/app/settings/language_screen.dart';
import 'package:ecommerce_project_api/screens/onboarding_screen/onborading_screen.dart';
import 'package:ecommerce_project_api/screens/splash_screen/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce_project_api/pref/shared_pref_controller.dart';
import 'package:ecommerce_project_api/screens/auth/forgot_password_screen.dart';
import 'package:ecommerce_project_api/screens/auth/login_screen.dart';
import 'package:ecommerce_project_api/screens/auth/register_screen.dart';
import 'package:ecommerce_project_api/screens/launch_screen.dart';
import 'package:ecommerce_project_api/screens/auth/activate_screen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ecommerce_project_api/getx/language_getx.dart';
import 'package:get/get.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:ecommerce_project_api/screens/app/favorite/favorite_product.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DbController().initDatabase();
  await SharedPrefController().initPreferences();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);
  final LanguageGetxController languageGetxController =
      Get.put<LanguageGetxController>(LanguageGetxController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LanguageGetxController>(
      builder: (controller) {
        return ScreenUtilInit(
            designSize: const Size(375, 812),
            minTextAdapt: true,
            splitScreenMode: true,
            builder: (context, child) {
              return MaterialApp(
                localizationsDelegates: const [
                  AppLocalizations.delegate,
                  GlobalMaterialLocalizations.delegate,
                  GlobalWidgetsLocalizations.delegate,
                  GlobalCupertinoLocalizations.delegate,
                ],
                locale: Locale(languageGetxController.language),
                debugShowCheckedModeBanner: false,
                supportedLocales: const [Locale('en'), Locale('ar')],
                initialRoute: '/launch_screen',
                routes: {
                  '/launch_screen': (context) => const LaunchScreen(),
                  '/on_boarding_screen': (context) => const OnBoardingScreen(),
                  '/splash_screen': (context) => const SplashScreen(),
                  '/login_screen': (context) => const LoginScreen(),
                  '/register_screen': (context) => const RegisterScreen(),
                  '/activate_screen': (context) => ActivateScreen(),
                  '/forgot_password_screen': (context) =>
                      const ForgotPasswordScreen(),
                  '/home_screen': (context) => const HomeScreen(),
                  '/category_screen': (context) => CategoryScreen(),
                  '/bottom_navigation_screen': (context) =>
                      const BottomNavigationScreen(),
                  '/cart_screen': (context) => const CartScreen(),
                  '/language_screen': (context) => const LanguageScreen(),
                  '/favorite_screen': (context) =>
                      const FavoriteProductScreen(),
                },
              );
            });
      },
    );
  }
}
