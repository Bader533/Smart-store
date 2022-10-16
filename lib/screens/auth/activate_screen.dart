import 'package:ecommerce_project_api/widgets/text_filed.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ecommerce_project_api/api/controllers/auth_api_controller.dart';
import 'package:ecommerce_project_api/utlis/helpers.dart';

class ActivateScreen extends StatefulWidget with Helpers {
  ActivateScreen({Key? key}) : super(key: key);

  @override
  State<ActivateScreen> createState() => _ActivateScreenState();
}

class _ActivateScreenState extends State<ActivateScreen> {
  late TextEditingController _mobile;
  late TextEditingController _code;

  @override
  void initState() {
    super.initState();
    _mobile = TextEditingController();
    _code = TextEditingController();
  }

  @override
  void dispose() {
    _mobile.dispose();
    _code.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
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
              'Sign Up',
              style:
                  GoogleFonts.actor(fontWeight: FontWeight.w600, fontSize: 20),
            ),
            SizedBox(
              height: 15.r,
            ),
            Text(
              'Create an new account',
              style: GoogleFonts.actor(
                fontWeight: FontWeight.w400,
                color: const Color(0xFF666666),
                fontSize: 14,
              ),
            ),
            const SizedBox(height: 20),
            TextFieldWidget(
                controller: _mobile,
                textInputType: TextInputType.phone,
                hint: 'Mobile',
                iconData: Icons.person,
                iconDataSuffix: Icons.check_circle,
                obscure: false),
            const SizedBox(height: 10),
            TextFieldWidget(
                controller: _code,
                textInputType: TextInputType.phone,
                hint: 'Code',
                iconData: Icons.lock,
                iconDataSuffix: Icons.check_circle,
                obscure: false),
            const SizedBox(height: 15),
            ElevatedButton(
              onPressed: () async {
                bool status = await AuthApiController().activateAccount(context,
                    mobile: _mobile.text, code: _code.text);
                if (status) {
                  Navigator.pushReplacementNamed(context, '/login_screen');
                }
              },
              style: ElevatedButton.styleFrom(
                maximumSize: Size(double.infinity, 55.h),
                primary: const Color(0xFF000000),
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(45.r),
                ),
              ),
              child: Text(
                'Confirm',
                style: GoogleFonts.montserrat(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
