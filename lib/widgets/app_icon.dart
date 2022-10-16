import 'package:flutter/material.dart';
class AppIcon extends StatelessWidget {
  final IconData iconData;
  final Color? backGroundColor;
  final Color? iconColor;
  final double? size;

  const AppIcon(
      {Key? key,
      required this.iconData,
      this.backGroundColor,
      this.iconColor,
      this.size})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(size! / 2),
        color: backGroundColor,
      ),
      child: Icon(
        iconData,
        color: iconColor,
        size: 16,
      ),
    );
  }
}
