import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OnBoardingIndicator extends StatelessWidget {
  const OnBoardingIndicator({
    Key? key,
    required bool isSelected,
    double marginEnd = 0,
  })  : _isSelected = isSelected,
        _marginEnd = marginEnd,
        super(key: key);

  final bool _isSelected;
  final double _marginEnd;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: _isSelected ? 20.w : 7.w,
      height: _isSelected ? 5.w : 7.w,
      margin: EdgeInsetsDirectional.only(end: _marginEnd),
      decoration: BoxDecoration(
        color: _isSelected ? const Color(0xFF000000) : const Color(0xFFDDDDDD),
        borderRadius: BorderRadius.circular(3.r),
      ),
    );
  }
}
