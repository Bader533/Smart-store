import 'package:ecommerce_project_api/pref/shared_pref_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  // @override
  // void initState() {
  //   super.initState();
  //   Future.delayed(const Duration(seconds: 3), () {
  //     String route = SharedPrefController().loggedIn ? '/bottom_navigation_screen' : '/login_screen';
  //     Navigator.pushReplacementNamed(context, route);
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("images/splash.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding:
                  const EdgeInsets.only(left: 94, top: 25, right: 94, bottom: 370).r,
              child: const Image(image: AssetImage("images/logo.png")),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 50, vertical: 2).r,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  maximumSize: Size(double.infinity, 45.h),
                  primary: const Color(0xFFFFFFFF),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(45.r),
                  ),
                ),
                onPressed: () {
                  Navigator.pushReplacementNamed(context, '/login_screen');
                },
                child: Text(
                  'Login',
                  style: GoogleFonts.montaga(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.bold,
                    color: const Color(0xFF000000),
                  ),
                ),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 50, vertical: 2).r,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  maximumSize: Size(double.infinity, 45.h),
                  primary: Colors.transparent,
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(45.r),
                  ),
                  side: const BorderSide(color: Color(0xFFFFFFFF)),
                ),
                onPressed: () {
                  Navigator.pushReplacementNamed(context, '/register_screen');
                },
                child: Text(
                  'Sign Up',
                  style: GoogleFonts.montaga(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.bold,
                    color: const Color(0xFFFFFFFF),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
