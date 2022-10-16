import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ecommerce_project_api/api/controllers/auth_api_controller.dart';
import 'package:ecommerce_project_api/models/api_response.dart';
import 'package:ecommerce_project_api/screens/auth/reset_password_screen.dart';
import 'package:ecommerce_project_api/utlis/helpers.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({Key? key}) : super(key: key);

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen>
    with Helpers {
  late TextEditingController _mobileTextController;

  @override
  void initState() {
    super.initState();
    _mobileTextController = TextEditingController();
  }

  @override
  void dispose() {
    _mobileTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          'FORGOT PASSWORD',
          style: GoogleFonts.actor(
            color: Colors.black,
          ),
        ),
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Welcome back...',
              style: GoogleFonts.actor(
                  fontWeight: FontWeight.bold, fontSize: 24, letterSpacing: 1),
            ),
            Text(
              'Enter You mobile',
              style: GoogleFonts.actor(
                fontWeight: FontWeight.w300,
                color: Colors.black45,
                fontSize: 15,
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              keyboardType: TextInputType.phone,
              controller: _mobileTextController,
              decoration: InputDecoration(
                hintText: 'Phone',
                prefixIcon: const Icon(Icons.phone),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(
                    width: 1,
                    color: Colors.grey,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(
                    width: 1,
                    color: Colors.blue,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async => await _performForgotPassword(),
              style: ElevatedButton.styleFrom(
                primary: Colors.blueGrey,
                minimumSize: Size(double.infinity, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: const Text('SEND'),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _performForgotPassword() async {
    if (_checkData()) {
      await _forgotPassword();
    }
  }

  bool _checkData() {
    if (_mobileTextController.text.isNotEmpty) {
      return true;
    }
    // showSnackBar(context, message: 'Enter required data!', error: true);
    return false;
  }

  Future<void> _forgotPassword() async {
    ApiResponse apiResponse = await AuthApiController()
        .forgotPassword(mobile: _mobileTextController.text);
    if (apiResponse.success) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) =>
              ResetPasswordScreen(mobile: _mobileTextController.text),
        ),
      );
    }
    showSnackBar(
      context,
      message: apiResponse.message,
      error: !apiResponse.success,
    );
  }
}
