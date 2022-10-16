import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class ListTitleSettings extends StatelessWidget {
  const ListTitleSettings({
    Key? key,
    required String name,
    required IconData iconData,
    required void Function() onPressed,
  })  : _name = name,
        _iconData = iconData,
        _onPressed = onPressed,
        super(key: key);

  final String _name;
  final IconData _iconData;
  final void Function() _onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0).r,
      child: ListTile(
        leading: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.r),
            color: const Color(0xFFEEEEEE),
          ),
          width: 40.w,
          height: 40.h,
          child: Icon(
            _iconData,
            color: Colors.black,
          ),
        ),
        title: Text(
          _name,
          style: GoogleFonts.montserrat(
            fontSize: 14.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
        trailing: IconButton(
          onPressed: _onPressed,
          icon: const Icon(Icons.arrow_forward_ios),
        ),
      ),
    );
  }
}
