import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class OnBoardingContent extends StatelessWidget {
  const OnBoardingContent(
      {Key? key,
      required String image,
      required String title,
      required String subTitle})
      : _image = image,
        _title = title,
        _subTitle = subTitle,
        super(key: key);

  final String _image;
  final String _title;
  final String _subTitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 15.h,
        ),
        Image.asset("images/$_image.png",width: 345.w,height: 450.w,),
        Padding(
          // padding: const EdgeInsets.all(8.0),
          padding: const EdgeInsets.only(left: 25, right: 58, top: 30).r,
          child: Column(
            children: [
              Text(
                _title,
                style: GoogleFonts.montserrat(
                  fontSize: 25.sp,
                  fontWeight: FontWeight.bold,
                  color: const Color(0xFF000000),
                ),
              ),
              SizedBox(
                height: 18.h,
              ),
              Text(
                _subTitle,
                style: GoogleFonts.montserrat(
                  fontSize: 15.sp,
                  color: const Color(0xFF666666),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
