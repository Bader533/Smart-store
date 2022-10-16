import 'package:ecommerce_project_api/getx/home_getx_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class ListItemPage extends StatelessWidget {
  const ListItemPage({Key? key}) : super(key: key);

  get body => null;

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      childAspectRatio: 0.68,
      crossAxisCount: 2,
      shrinkWrap: true,
      children: [
        Container(
          padding: const EdgeInsets.only(left: 15, right: 15, top: 10).r,
          margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 8).r,
          decoration: BoxDecoration(
            color: Colors.black45,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            children: [

              // Row(
              //   mainAxisAlignment: MainAxisAlignment.end,
              //   children: [
              //     Container(
              //       padding: const EdgeInsets.all(8.0).r,
              //       decoration: BoxDecoration(
              //         color: const Color(0xFF000000),
              //         borderRadius: BorderRadius.circular(20),
              //       ),
              //       child: const Icon(
              //         Icons.favorite_border,
              //         color: Color(0xFFFFFFFF),
              //       ),
              //     )
              //   ],
              // ),
              // InkWell(
              //
              //   onTap: () {},
              //   child: Expanded(
              //     child: Container(
              //       // // height: 2,
              //       // width: 255,
              //       child: Padding(
              //         padding: const EdgeInsets.all(.01),
              //         child: Image.asset(
              //           'images/Rectangle 21.png',
              //           // width: 199.w,
              //           // height: 170,
              //         ),
              //       ),
              //     ),
              //   ),
              // ),
            ],
          ),
        ),
      ],
      // gridDelegate: gridDelegate
    );
  }
}
