import 'package:ecommerce_project_api/pref/shared_pref_controller.dart';
import 'package:ecommerce_project_api/screens/app/settings/language_screen.dart';
import 'package:ecommerce_project_api/utlis/helpers.dart';
import 'package:ecommerce_project_api/widgets/list_title_settings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SettingsScreen extends StatefulWidget with Helpers {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
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
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5).r,
            child: Row(
              children: [
                Text(
                  AppLocalizations.of(context)!.settings,
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
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5).r,
            child: Card(
              // elevation: 10,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18),
                side: const BorderSide(color: Color(0xFFDDDDDD), width: 1.5),
              ),
              child: Column(
                children: [
                  ListTitleSettings(
                      name: AppLocalizations.of(context)!.language,
                      iconData: Icons.language,
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const LanguageScreen()),
                        );
                      }),
                  ListTitleSettings(
                      name: AppLocalizations.of(context)!.notification,
                      iconData: Icons.notifications,
                      onPressed: () {}),
                  ListTitleSettings(
                      name: AppLocalizations.of(context)!.dark_mood,
                      iconData: Icons.dark_mode,
                      onPressed: () {}),
                  ListTitleSettings(
                      name: AppLocalizations.of(context)!.help,
                      iconData: Icons.help,
                      onPressed: () {}),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
