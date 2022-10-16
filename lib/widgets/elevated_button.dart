import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class ElevateButton extends StatelessWidget {
  const ElevateButton({
    Key? key,
    required void Function() onPressed,
    required Color primaryColor,
    required String textButton,
    required Color textColor,
    required double width,
    required double height,
  })  : _onPressed = onPressed,
        _primaryColor = primaryColor,
        _textButton = textButton,
        _textColor = textColor,
        _width = width,
        _height = height,
        super(key: key);

  final void Function() _onPressed;
  final Color _primaryColor;
  final String _textButton;
  final Color _textColor;
  final double _width;
  final double _height;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed:_onPressed,
      style: ElevatedButton.styleFrom(
        primary: _primaryColor,
        // minimumSize: Size(double.infinity, 50.r),
        minimumSize: Size(_width, _height),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(40.r),
        ),
      ),
      child: Text(
        _textButton,
        style: GoogleFonts.montserrat(
            fontWeight: FontWeight.bold, fontSize: 16.sp, color: _textColor),
      ),
    );
  }
}
