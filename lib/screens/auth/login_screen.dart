import 'package:ecommerce_project_api/widgets/elevated_button.dart';
import 'package:ecommerce_project_api/widgets/text_filed.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ecommerce_project_api/api/controllers/auth_api_controller.dart';
import 'package:ecommerce_project_api/models/api_response.dart';
import 'package:ecommerce_project_api/utlis/helpers.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> with Helpers {
  late TextEditingController _mobileTextController;
  late TextEditingController _passwordTextController;

  @override
  void initState() {
    super.initState();
    _mobileTextController = TextEditingController();
    _passwordTextController = TextEditingController();
  }

  @override
  void dispose() {
    _mobileTextController.dispose();
    _passwordTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24).r,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(vertical: 22.r),
                child: Image(
                  width: 156.w,
                  height: 100.w,
                  image: const AssetImage("images/logo.png"),
                  color: Colors.black,
                ),
              ),
              Text(
                'Welcome!',
                style: GoogleFonts.montserrat(
                    fontWeight: FontWeight.w600, fontSize: 20.sp),
              ),
              Text(
                'please login or sign up to continue our app',
                style: GoogleFonts.montserrat(
                    fontWeight: FontWeight.w400,
                    fontSize: 14.sp,
                    color: const Color(0xFF666666)),
              ),
              SizedBox(
                height: 47.h,
              ),
              TextFieldWidget(
                  controller: _mobileTextController,
                  textInputType: TextInputType.phone,
                  hint: 'Mobile',
                  iconData: Icons.phone,
                  iconDataSuffix: Icons.check_circle,
                  obscure: false),
              SizedBox(height: 14.h),
              TextFieldWidget(
                  controller: _passwordTextController,
                  textInputType: TextInputType.text,
                  hint: 'Password',
                  iconData: Icons.lock,
                  iconDataSuffix: Icons.check_circle,
                  obscure: true),
              SizedBox(
                height: 45.h,
              ),
              ElevateButton(
                onPressed: () async => await _performLogin(),
                width: double.infinity,
                height: 50.r,
                primaryColor: const Color(0xFF000000),
                textButton: 'LOGIN',
                textColor: const Color(0xFFFFFFFF),
              ),
              Center(
                child: TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/forgot_password_screen');
                  },
                  style: TextButton.styleFrom(
                    alignment: Alignment.center,
                  ),
                  child: const Text('Forgot Password?'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    const Expanded(
                      child: Divider(
                        color: Color(0xFF9A9A9A),
                        thickness: 1,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'or',
                        style: GoogleFonts.montserrat(
                            fontWeight: FontWeight.w400, fontSize: 14.sp),
                      ),
                    ),
                    const Expanded(
                      child: Divider(
                        color: Color(0xFF9A9A9A),
                        thickness: 1,
                      ),
                    ),
                  ],
                ),
              ),
              ElevateButton(
                onPressed: () {},
                width: double.infinity,
                height: 50.r,
                primaryColor: const Color(0xFF3B5998),
                textButton: 'Continue with Facebook',
                textColor: const Color(0xFFFFFFFF),
              ),
              SizedBox(
                height: 14.r,
              ),
              ElevateButton(
                onPressed: () {},
                width: double.infinity,
                height: 50.r,
                primaryColor: const Color(0xFFFFFFFF),
                textButton: 'Continue with Google',
                textColor: const Color(0xFF666666),
              ),
              SizedBox(
                height: 14.r,
              ),
              ElevateButton(
                onPressed: () {},
                width: double.infinity,
                height: 50.r,
                primaryColor: const Color(0xFFFFFFFF),
                textButton: 'Continue with Google',
                textColor: const Color(0xFF666666),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _performLogin() async {
    if (_checkData()) {
      await _login();
    }
  }

  bool _checkData() {
    if (_mobileTextController.text.isNotEmpty &&
        _passwordTextController.text.isNotEmpty) {
      return true;
    }
    // showSnackBar(context, message: 'Enter required data!', error: true);
    return false;
  }

  Future<void> _login() async {
    ApiResponse apiResponse = await AuthApiController().login(
        mobile: _mobileTextController.text,
        password: _passwordTextController.text);
    if (apiResponse.success) {
      Navigator.pushReplacementNamed(context, '/bottom_navigation_screen');
    }
    showSnackBar(
      context,
      message: apiResponse.message,
      error: !apiResponse.success,
    );
  }
}
