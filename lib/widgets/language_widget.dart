import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class LanguageWidget extends StatelessWidget {
  const LanguageWidget({
    Key? key,
    required String imageUrl,
    required String language,
    required void Function() onPressed,
  })  : _imageUrl = imageUrl,
        _language = language,
        _onPressed = onPressed,
        super(key: key);

  final String _imageUrl;
  final String _language;
  final void Function() _onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5).r,
      child: Card(
        // elevation: 10,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(18),
          side: const BorderSide(color: Color(0xFFDDDDDD), width: 1.5),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0).r,
          child: ListTile(
            leading: SizedBox(
                width: 40.w,
                height: 40.h,
                child:  CircleAvatar(
                  backgroundImage: AssetImage(_imageUrl),
                )),
            title: Text(
              _language,
              style: GoogleFonts.montserrat(
                fontSize: 14.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
            trailing: IconButton(
              onPressed: _onPressed,
              icon: const Icon(Icons.circle_outlined),
            ),
          ),
        ),
      ),
    );
  }
}
