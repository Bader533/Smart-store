import 'package:ecommerce_project_api/pref/shared_pref_controller.dart';
import 'package:ecommerce_project_api/screens/app/favorite/favorite_product.dart';
import 'package:ecommerce_project_api/screens/app/settings/settings_screen.dart';
import 'package:ecommerce_project_api/utlis/helpers.dart';
import 'package:ecommerce_project_api/widgets/list_title_settings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ProfileScreen extends StatefulWidget with Helpers {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  String? email = SharedPrefController().getByKey(key: PrefKeys.email.name);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: GestureDetector(
          child: const Icon(Icons.arrow_circle_left,
              color: Colors.black, size: 35),
          onTap: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          Padding(
              padding: EdgeInsets.only(right: 10.0.r),
              child: GestureDetector(
                onTap: () {},
                child: const Icon(
                  Icons.settings,
                  size: 26.0,
                  color: Colors.grey,
                ),
              )),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20, vertical: 5).r,
              child: Card(
                elevation: 10,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18),
                ),
                child: ListTile(
                  leading: Image.asset('images/Rectangle 74.png'),
                  title: Text(
                    SharedPrefController()
                        .getByKey(key: PrefKeys.fullName.name),
                    style: GoogleFonts.montserrat(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  subtitle: email == null
                      ? Text(
                          'app@gmail.com',
                          style: GoogleFonts.montserrat(
                            fontWeight: FontWeight.w400,
                            fontSize: 13.sp,
                          ),
                        )
                      : Text(
                          '$email',
                          style: GoogleFonts.montserrat(
                            fontWeight: FontWeight.w400,
                            fontSize: 13.sp,
                          ),
                        ),
                ),
              ),
            ),
            SizedBox(
              height: 15.h,
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20, vertical: 5).r,
              child: Card(
                // elevation: 10,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18),
                  side: const BorderSide(color: Color(0xFFDDDDDD), width: 1.5),
                ),
                child: Column(
                  children: [
                    ListTitleSettings(
                        name: AppLocalizations.of(context)!.personal,
                        iconData: Icons.person,
                        onPressed: () {}),
                    ListTitleSettings(
                        name: AppLocalizations.of(context)!.my_order,
                        iconData: Icons.shopping_bag,
                        onPressed: () {}),
                    ListTitleSettings(
                        name: AppLocalizations.of(context)!.favourite,
                        iconData: Icons.favorite,
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    const FavoriteProductScreen()),
                          );
                        }),
                    ListTitleSettings(
                        name: AppLocalizations.of(context)!.shipping,
                        iconData: Icons.local_shipping,
                        onPressed: () {}),
                    ListTitleSettings(
                        name: AppLocalizations.of(context)!.card,
                        iconData: Icons.credit_card_rounded,
                        onPressed: () {}),
                    ListTitleSettings(
                        name: AppLocalizations.of(context)!.settings,
                        iconData: Icons.settings,
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const SettingsScreen()),
                          );
                        }),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
