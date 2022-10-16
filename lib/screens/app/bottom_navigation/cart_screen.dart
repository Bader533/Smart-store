import 'package:ecommerce_project_api/getx/cart_getx_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  final CartGetxController cartGetxController =
      Get.put<CartGetxController>(CartGetxController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
                  // Navigator.pushReplacementNamed(context, '/category_screen');
                },
                child: const Icon(
                  Icons.shopping_cart,
                  size: 26.0,
                  color: Colors.black,
                ),
              )),
        ],
      ),
      body: GetX<CartGetxController>(
        builder: (CartGetxController controller) {
          // print(controller);
          if (controller.loading.isTrue) {
            return const Center(child: CircularProgressIndicator());
          } else if (controller.cartItem.isNotEmpty) {

            return ListView.builder(
                itemCount: controller.cartItem.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    onTap: () {
                    },
                    leading: const Icon(Icons.note),
                    title: Text(controller.cartItem[index].nameEn),
                    subtitle: Text('${controller.cartItem[index].price}'),
                    trailing: IconButton(
                      onPressed: () async => await delete(index: index),
                      icon: const Icon(Icons.delete),
                    ),
                  );
                });
          } else {
            return Center(
                child: Text(
                  'No Data',
                  style:
                  GoogleFonts.nunito(fontSize: 24, fontWeight: FontWeight.bold),
                ));
          }
        },
      ),
      // ListView(
      //   scrollDirection: Axis.vertical,
      //   shrinkWrap: true,
      //   children: [
      //     Padding(
      //       padding:
      //           const EdgeInsets.symmetric(horizontal: 25.0, vertical: 8.0).r,
      //       child: Row(
      //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //         children: [
      //           Text(
      //             'My Cart',
      //             style: GoogleFonts.montserrat(
      //               fontSize: 18.sp,
      //               fontWeight: FontWeight.bold,
      //             ),
      //           ),
      //         ],
      //       ),
      //     ),
      //     SizedBox(
      //       height: 8.h,
      //     ),
      //     // GetX<CartGetxController>(
      //     //   builder: (CartGetxController controller) {
      //     //     // print('cart length : ${controller.cartItem.first}');
      //     //     if (controller.loading.isTrue) {
      //     //       return const Center(child: CircularProgressIndicator());
      //     //     } else if (controller.cartItem.isNotEmpty) {
      //     //       return ListView.builder(
      //     //           itemCount: controller.cartItem.length,
      //     //           itemBuilder: (context, index) {
      //     //             return Container(
      //     //               color: Colors.transparent,
      //     //               child: Padding(
      //     //                 padding: const EdgeInsets.all(10),
      //     //                 child: Column(
      //     //                   children: [
      //     //                     ListTile(
      //     //                       leading: Image.asset(
      //     //                         controller.cartItem[index].imageUrl,
      //     //                         height: 100,
      //     //                         width: 80,
      //     //                       ),
      //     //                       title: Text(controller.cartItem[index].nameEn),
      //     //                       subtitle: Column(
      //     //                         crossAxisAlignment: CrossAxisAlignment.start,
      //     //                         children: [
      //     //                           // Text(controller.carts[index].),
      //     //                           SizedBox(
      //     //                             height: 10.w,
      //     //                           ),
      //     //                           Text('${controller.cartItem[index].price}'),
      //     //                         ],
      //     //                       ),
      //     //                       trailing: IconButton(
      //     //                           onPressed: () async {
      //     //                             print('delete');
      //     //                             await delete(index: index);
      //     //                           },
      //     //                           icon: const Icon(Icons.delete_outline)),
      //     //                     ),
      //     //                     Padding(
      //     //                       padding:
      //     //                           const EdgeInsets.only(left: 5, right: 5).r,
      //     //                       child: const Divider(thickness: 2),
      //     //                     ),
      //     //                   ],
      //     //                 ),
      //     //               ),
      //     //             );
      //     //           });
      //     //     } else {
      //     //       return Center(
      //     //           child: Text(
      //     //         'No Data',
      //     //         style: GoogleFonts.nunito(
      //     //             fontSize: 24, fontWeight: FontWeight.bold),
      //     //       ));
      //     //     }
      //     //   },
      //     // ),
      //     // =====================================================
      //     GetX<CartGetxController>(
      //       builder: (CartGetxController controller) {
      //         if (controller.loading.isTrue) {
      //           return const Center(child: CircularProgressIndicator());
      //         } else if (controller.cartItem.isNotEmpty) {
      //           return ListView.builder(
      //               itemCount: controller.cartItem.length,
      //               itemBuilder: (context, index) {
      //                 return ListTile(
      //                   onTap: () {
      //                     // Navigator.push(
      //                     //     context,
      //                     //     MaterialPageRoute(
      //                     //         builder: (context) => NoteScreen(
      //                     //           note: controller.notes[index],
      //                     //         )));
      //                   },
      //                   leading: const Icon(Icons.note),
      //                   title: Text(controller.cartItem[index].nameEn),
      //                   subtitle: Text('${controller.cartItem[index].price}'),
      //                   trailing: IconButton(
      //                     onPressed: () async => await delete(index: index),
      //                     icon: const Icon(Icons.delete),
      //                   ),
      //                 );
      //               });
      //         } else {
      //           return Center(
      //               child: Text(
      //                 'No Data',
      //                 style:
      //                 GoogleFonts.nunito(fontSize: 24, fontWeight: FontWeight.bold),
      //               ));
      //         }
      //       },
      //     ),
      //     // =====================================================
      //     Padding(
      //       padding: EdgeInsets.only(top: 190.r),
      //       child: Row(
      //         mainAxisAlignment: MainAxisAlignment.center,
      //         children: [
      //           ElevatedButton(
      //               onPressed: () {
      //                 print('done payment');
      //               },
      //               style: ElevatedButton.styleFrom(
      //                 backgroundColor: Colors.black,
      //                 shape: RoundedRectangleBorder(
      //                   borderRadius: BorderRadius.circular(10),
      //                 ),
      //               ),
      //               child: Padding(
      //                 padding: const EdgeInsets.symmetric(
      //                         horizontal: 35, vertical: 15)
      //                     .r,
      //                 child: Text(
      //                   'Proceed to Checkout',
      //                   style: GoogleFonts.montserrat(
      //                     fontWeight: FontWeight.w600,
      //                     fontSize: 18,
      //                     color: Colors.white,
      //                   ),
      //                 ),
      //               ))
      //         ],
      //       ),
      //     ),
      //   ],
      // ),
    );
  }

  Future<void> delete({required int index}) async {
    // ProcessResponse processResponse =
    //     await CartGetxController.to.delete(index: index);

    // showSnackBar(context,
    //     message: processResponse.message, error: !processResponse.success);
  }
}

//=================================================
// ListView.builder(
//   shrinkWrap: true,
//   itemCount: 2,
//   physics: const NeverScrollableScrollPhysics(),
//   itemBuilder: (context, index) {
//     return Container(
//       color: Colors.transparent,
//       child: Padding(
//         padding: const EdgeInsets.all(10),
//         child: Column(
//           children: [
//             ListTile(
//               leading: Image.asset(
//                 'images/product.png',
//                 height: 100,
//                 width: 80,
//               ),
//               title: const Text('Gia Borghini'),
//               subtitle: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   const Text('RHW Rosie 1 Sandals'),
//                   SizedBox(
//                     height: 10.w,
//                   ),
//                   const Text('740.00'),
//                 ],
//               ),
//               trailing: IconButton(
//                   onPressed: () {
//                     print('delete');
//                   },
//                   icon: const Icon(Icons.delete_outline)),
//             ),
//             Padding(
//               padding: const EdgeInsets.only(left: 5, right: 5).r,
//               child: const Divider(thickness: 2),
//             ),
//           ],
//         ),
//       ),
//     );
//   },
// ),
