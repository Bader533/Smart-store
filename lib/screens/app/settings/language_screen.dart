import 'package:ecommerce_project_api/getx/language_getx.dart';
import 'package:ecommerce_project_api/pref/shared_pref_controller.dart';
import 'package:ecommerce_project_api/utlis/helpers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ecommerce_project_api/widgets/language_widget.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class LanguageScreen extends StatefulWidget with Helpers {
  const LanguageScreen({Key? key}) : super(key: key);

  @override
  State<LanguageScreen> createState() => _LanguageScreenState();
}

class _LanguageScreenState extends State<LanguageScreen> {
  String? email = SharedPrefController().getByKey(key: PrefKeys.email.name);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: GestureDetector(
          child: const Icon(Icons.arrow_circle_left,
              color: Colors.black, size: 35),
          onTap: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
            child: TextField(
              keyboardType: TextInputType.text,
              textInputAction: TextInputAction.search,
              style: GoogleFonts.nunito(),
              decoration: InputDecoration(
                hintText: 'Search',
                prefixIcon: const Icon(Icons.search),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(40),
                  borderSide: const BorderSide(
                    width: 1,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(40),
                  borderSide: const BorderSide(
                    width: 1,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 16.h,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5).r,
            child: Row(
              children: [
                Text(
                  AppLocalizations.of(context)!.country,
                  style: GoogleFonts.montserrat(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 15.h,
          ),
          LanguageWidget(
              imageUrl: 'images/Ellipse 48.png',
              language: AppLocalizations.of(context)!.english,
              onPressed: () {
                LanguageGetxController.to.changeLanguage('en');
              }),
          LanguageWidget(
              imageUrl: 'images/Ellipse 48.png',
              language: AppLocalizations.of(context)!.arabic,
              onPressed: () {
                LanguageGetxController.to.changeLanguage('ar');
              }),
        ],
      ),
    );
  }
}
