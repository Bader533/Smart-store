import 'package:ecommerce_project_api/api/controllers/favorite_api_controller.dart';
import 'package:ecommerce_project_api/models/favorite_products.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class FavoriteProductScreen extends StatelessWidget {
  const FavoriteProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
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
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.h),
            child: TextField(
              keyboardType: TextInputType.text,
              textInputAction: TextInputAction.search,
              style: GoogleFonts.nunito(),
              decoration: InputDecoration(
                hintText: 'Search',
                prefixIcon: const Icon(Icons.search),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(40),
                  borderSide: const BorderSide(
                    width: 1,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(40),
                  borderSide: const BorderSide(
                    width: 1,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 15.h,
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 25.0, vertical: 10).r,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  AppLocalizations.of(context)!.favorite,
                  style: GoogleFonts.montserrat(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                // Text(
                //   AppLocalizations.of(context)!.view_all,
                //   style: GoogleFonts.montserrat(
                //     fontSize: 11.sp,
                //     fontWeight: FontWeight.w600,
                //   ),
                // ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: FutureBuilder<List<FavoriteProducts>>(
              future: FavoriteApiController().getFavoriteProducts(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return SizedBox(
                    width: 325.w,
                    height: 130.h,
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: snapshot.data!.length,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        return Card(
                          elevation: 4,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: ListTile(
                            leading: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              width: 80,
                              child: Image.network(
                                  snapshot.data![index].imageUrl,
                                  fit: BoxFit.cover),
                            ),
                            title: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(snapshot.data![index].nameEn),
                                // SizedBox(
                                //   height: 10.h,
                                // ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        const Icon(
                                          Icons.attach_money,
                                          color: Colors.black,
                                        ),
                                        Text(snapshot.data![index].price),
                                      ],
                                    ),
                                    SizedBox(
                                      width: 100.w,
                                      // height: 30.h,
                                      child: ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: Colors.black,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(40),
                                          ),
                                        ),
                                        onPressed: () {},
                                        child: Text(
                                          'Add to cart',
                                          style: GoogleFonts.montserrat(
                                            fontSize: 11.sp,
                                            fontWeight: FontWeight.w600,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  );
                } else if (snapshot.hasError) {
                  return Text('error : ${snapshot.error}');
                }
                return const Center(child: CircularProgressIndicator());
              },
            ),
          ),
        ],
      ),
    );
  }
}
