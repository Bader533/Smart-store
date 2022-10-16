import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyAppBar extends StatefulWidget {
  const MyAppBar({
    Key? key,
  }) : super(key: key);

  @override
  State<MyAppBar> createState() => _MyAppBarState();
}

class _MyAppBarState extends State<MyAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
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
        child: Image.asset('images/menu.png'),

      ),
      actions: [
        Padding(
            padding: EdgeInsets.only(right: 10.0.r),
            child: GestureDetector(
              onTap: () {
                Navigator.pushReplacementNamed(context, '/category_screen');
              },
              child: const Icon(
                Icons.search,
                size: 26.0,
                color: Colors.black,
              ),
            )),
      ],
    );
  }
}