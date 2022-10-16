import 'package:ecommerce_project_api/pref/shared_pref_controller.dart';
import 'package:ecommerce_project_api/utlis/helpers.dart';
import 'package:ecommerce_project_api/widgets/list_title_settings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class NotifyScreen extends StatefulWidget with Helpers {
  const NotifyScreen({Key? key}) : super(key: key);

  @override
  State<NotifyScreen> createState() => _NotifyScreenState();
}

class _NotifyScreenState extends State<NotifyScreen> {
  String? email = SharedPrefController().getByKey(key: PrefKeys.email.name);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Container(
          width: 35.w,
          height: 35,
          decoration: BoxDecoration(
            color: const Color(0xFF000000),
            borderRadius: BorderRadius.circular(40.r),
          ),
          child: Image.asset('images/arrow.png'),
        ),
        actions: [
          Padding(
              padding: EdgeInsets.only(right: 10.0.r),
              child: GestureDetector(
                onTap: () {
                  Navigator.pop(context, '/category_screen');
                },
                child: const Icon(
                  Icons.settings,
                  size: 26.0,
                  color: Colors.grey,
                ),
              )),
        ],
      ),

    );
  }
}
