import 'package:ecommerce_project_api/api/controllers/favorite_api_controller.dart';
import 'package:ecommerce_project_api/api/controllers/product_api_controller.dart';
import 'package:ecommerce_project_api/getx/cart_getx_controller.dart';
import 'package:ecommerce_project_api/models/cart.dart';
import 'package:ecommerce_project_api/models/product.dart';
import 'package:ecommerce_project_api/pref/shared_pref_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';

class ProductScreen extends StatefulWidget {
  final int id;

  const ProductScreen({super.key, required this.id});

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  int _favorite = 0;
  final CartGetxController cartGetxController =
      Get.put<CartGetxController>(CartGetxController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: GestureDetector(
          child: const Icon(Icons.arrow_circle_left,
              color: Colors.black, size: 35),
          onTap: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: FutureBuilder<Product?>(
        future: ProductApiController().getProductDetails(id: widget.id),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return SingleChildScrollView(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 25, vertical: 15).r,
                child: Column(
                  children: [
                    Container(
                      height: 330.h,
                      // color: Colors.red,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        image: DecorationImage(
                          fit: BoxFit.fill,
                          image: NetworkImage(
                            snapshot.data!.imageUrl,
                          ),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Padding(
                            padding:
                                const EdgeInsets.only(top: 10, bottom: 5).r,
                            child: IconButton(
                              icon: Icon(
                                _favorite == 0
                                    ? Icons.favorite_border
                                    : Icons.favorite,
                                size: 30,
                              ),
                              color: Colors.black,
                              onPressed: () {
                                // favorite = favorite == 0 ? 1 : 0;
                                setState(() {
                                  _favorite = _favorite == 0 ? 1 : 0;
                                  FavoriteApiController().addFavorite(
                                    product_id: snapshot.data!.id,
                                  );
                                });
                              },
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          snapshot.data!.nameEn,
                          style: GoogleFonts.montserrat(
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Clean 90 Triole Sneakers',
                              style: GoogleFonts.montserrat(
                                fontSize: 11.sp,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            Column(
                              children: [
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 22, vertical: 5),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: const Color(0xFFEEEEEE),
                                  ),
                                  child: Text(
                                    snapshot.data!.quantity,
                                  ),
                                ),
                                const Text('Avaliable in stok'),
                              ],
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                RatingBar.builder(
                                  initialRating: snapshot.data!.productRate,
                                  minRating: 0,
                                  direction: Axis.horizontal,
                                  // allowHalfRating: true,
                                  itemCount: 5,
                                  itemPadding: const EdgeInsets.symmetric(
                                      horizontal: 4.0),
                                  itemBuilder: (context, _) => const Icon(
                                    Icons.star,
                                    color: Colors.amber,
                                  ),
                                  onRatingUpdate: (rating) {
                                    print(snapshot.data!.id);
                                  },
                                ),
                                // Wrap(
                                //   children: List.generate(5, (index) {
                                //     return const Icon(
                                //       Icons.star,
                                //       color: Colors.yellow,
                                //     );
                                //   }),
                                // ),
                                // SizedBox(
                                //   width: 10.w,
                                // ),
                                // Text(
                                //   '${snapshot.data!.productRate}',
                                //   style: GoogleFonts.montserrat(
                                //     fontWeight: FontWeight.w400,
                                //     fontSize: 11.sp,
                                //   ),
                                // ),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 30.h,
                        ),
                        Text(
                          'Description',
                          style: GoogleFonts.montserrat(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        Text(
                          snapshot.data!.infoEn,
                          style: GoogleFonts.montserrat(
                            fontWeight: FontWeight.w400,
                            fontSize: 11.sp,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              'Total Price',
                              style: GoogleFonts.montserrat(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            Text(
                              snapshot.data!.price,
                              style: GoogleFonts.montserrat(
                                fontSize: 24.sp,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            ElevatedButton(
                              onPressed: () async {
                                Cart cartItem = Cart();
                                cartItem.imageUrl = snapshot.data!.imageUrl;
                                cartItem.productId = 1;
                                cartItem.price = 22.33;
                                cartItem.nameEn = snapshot.data!.nameEn;
                                cartItem.quantity = 1;
                                cartItem.totalPrice = 22.33;
                                cartItem.userId = SharedPrefController()
                                    .getByKey(key: PrefKeys.id.name);
                                CartGetxController.to.manageCart(cartItem);
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.black,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(40),
                                ),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(11.0),
                                child: Row(
                                  children: [
                                    const Icon(
                                      Icons.shopping_cart,
                                      color: Colors.white,
                                    ),
                                    Text(
                                      'Add to cart',
                                      style: GoogleFonts.montserrat(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 16.sp,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          } else if (snapshot.hasError) {
            return Text('error : ${snapshot.error}');
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }

// Cart cartItem(String url, int product, double price, String name) {
//   Cart cartItem = Cart();
//   cartItem.imageUrl = url;
//   cartItem.productId = product;
//   cartItem.price = price;
//   cartItem.nameEn = name;
//   cartItem.quantity = '1';
//   print(cartItem);
//   return cartItem;
// }
}

//===================================================================

//===================================================================
// Padding(
//   padding: const EdgeInsets.symmetric(horizontal: 25,vertical: 15).r,
//   child: Container(
//
//     height: 330.h,
//     // color: Colors.red,
//     decoration: BoxDecoration(
//       borderRadius: BorderRadius.circular(20),
//       image: DecorationImage(
//         fit: BoxFit.fill,
//         image: NetworkImage(
//           snapshot.data!.imageUrl,
//         ),
//       ),
//     ),
//     // child: Row(
//     //   mainAxisAlignment: MainAxisAlignment.end,
//     //   crossAxisAlignment: CrossAxisAlignment.end,
//     //   children: [
//     //     Padding(
//     //       padding: const EdgeInsets.only(top: 10, bottom: 5).r,
//     //       child: IconButton(
//     //         icon: const Icon(
//     //           Icons.favorite,
//     //           size: 35,
//     //         ),
//     //         color: Colors.black,
//     //         onPressed: () {},
//     //       ),
//     //     )
//     //   ],
//     // ),
//   ),
// ),
// Padding(
//   padding: const EdgeInsets.only(left: 0, top: 310, right: 0).r,
//   child: Container(
//     padding: EdgeInsets.only(
//       left: 20.r,
//       right: 20.r,
//       top: 10.r,
//     ),
//     decoration: const BoxDecoration(
//       borderRadius: BorderRadius.only(
//         topRight: Radius.circular(20),
//         topLeft: Radius.circular(20),
//       ),
//       color: Color(0xE7E7E8E3),
//     ),
//     child: Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text(
//           snapshot.data!.nameEn,
//           style: GoogleFonts.montserrat(
//             fontSize: 18.sp,
//             fontWeight: FontWeight.w600,
//           ),
//         ),
//         Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             Text(
//               'Clean 90 Triole Sneakers',
//               style: GoogleFonts.montserrat(
//                 fontSize: 11.sp,
//                 fontWeight: FontWeight.w400,
//               ),
//             ),
//             Column(
//               children: [
//                 Container(
//                   padding: const EdgeInsets.symmetric(
//                       horizontal: 22, vertical: 5),
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(20),
//                     color: Color(0xFFEEEEEE),
//                   ),
//                   child: Text(
//                     snapshot.data!.quantity,
//                   ),
//                 ),
//                 Text('Avaliable in stok'),
//               ],
//             ),
//           ],
//         ),
//         Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             Row(
//               children: [
//                 Wrap(
//                   children: List.generate(5, (index) {
//                     return const Icon(
//                       Icons.star,
//                       color: Colors.yellow,
//                     );
//                   }),
//                 ),
//                 SizedBox(
//                   width: 10.w,
//                 ),
//                 Text(
//                   '${snapshot.data!.productRate}',
//                   style: GoogleFonts.montserrat(
//                     fontWeight: FontWeight.w400,
//                     fontSize: 11.sp,
//                   ),
//                 ),
//               ],
//             ),
//           ],
//         ),
//         SizedBox(
//           height: 30.h,
//         ),
//         Text(
//           'Description',
//           style: GoogleFonts.montserrat(
//             fontSize: 16.sp,
//             fontWeight: FontWeight.w600,
//           ),
//         ),
//         SizedBox(
//           height: 10.h,
//         ),
//         Text(
//           snapshot.data!.infoEn,
//           style: GoogleFonts.montserrat(
//             fontWeight: FontWeight.w400,
//             fontSize: 11.sp,
//           ),
//         ),
//       ],
//     ),
//   ),
// ),
// Padding(
//   padding: EdgeInsets.only(
//     left: 20.r,
//     right: 20.r,
//     top: 10.r,
//     bottom: 20.r,
//   ),
//   child: Row(
//     crossAxisAlignment: CrossAxisAlignment.end,
//     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//     children: [
//       Column(
//         mainAxisAlignment: MainAxisAlignment.end,
//         children: [
//           Text(
//             'Total Price',
//             style: GoogleFonts.montserrat(
//               fontSize: 14.sp,
//               fontWeight: FontWeight.w400,
//             ),
//           ),
//           Text(
//             snapshot.data!.price,
//             style: GoogleFonts.montserrat(
//               fontSize: 24.sp,
//               fontWeight: FontWeight.bold,
//             ),
//           ),
//         ],
//       ),
//       Column(
//         mainAxisAlignment: MainAxisAlignment.end,
//         children: [
//           ElevatedButton(
//             onPressed: () async {
//               await cartItem;
//               // Cart cartItem = Cart();
//               // cartItem.imageUrl = snapshot.data!.imageUrl;
//               // cartItem.productId = snapshot.data!.id;
//               // cartItem.price = snapshot.data!.price;
//               // cartItem.nameEn = snapshot.data!.nameEn;
//               // cartItem.quantity = 1;
//               // print(' cartItem :: ${cartItem.nameEn}');
//             },
//             style: ElevatedButton.styleFrom(
//               shape: RoundedRectangleBorder(
//                 borderRadius: BorderRadius.circular(40),
//               ),
//               primary: Colors.black,
//             ),
//             child: Padding(
//               padding: const EdgeInsets.all(11.0),
//               child: Row(
//                 children: [
//                   const Icon(
//                     Icons.shopping_cart,
//                     color: Colors.white,
//                   ),
//                   Text(
//                     'Add to cart',
//                     style: GoogleFonts.montserrat(
//                       fontWeight: FontWeight.w600,
//                       fontSize: 16.sp,
//                     ),
//                   )
//                 ],
//               ),
//             ),
//           )
//         ],
//       ),
//     ],
//   ),
// ),
