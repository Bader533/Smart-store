import 'package:ecommerce_project_api/api/controllers/sub_category_api_controller.dart';
import 'package:ecommerce_project_api/models/sub_category.dart';
import 'package:ecommerce_project_api/screens/app/product/all_Product_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class SubCategoryScreen extends StatelessWidget {
  final int id;

  SubCategoryScreen({required this.id});

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
            Navigator.pushNamed(context, '/category_screen');
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
          Expanded(
            child: FutureBuilder<List<SubCategory>>(
              future: SubCategoryApiController().getSubCategory(id: id),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return GridView.builder(
                    shrinkWrap: true,
                    itemCount: snapshot.data!.length,
                    padding: const EdgeInsets.all(5).r,
                    physics: const BouncingScrollPhysics(),
                    gridDelegate:
                         SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 12.r,
                      crossAxisSpacing: 12.r,
                      // mainAxisExtent: 50,
                      childAspectRatio: 155 / 170,
                    ),
                    itemBuilder: (context, index) {
                      return Container(
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30.r),
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(
                              snapshot.data![index].imageUrl,
                            ),
                          ),
                        ),
                        child: Row(
                          children: [
                            Container(
                              margin: EdgeInsets.only(top: 125.r),
                              width: 170,
                              height: 80,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(25),
                                color: Colors.white54,
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      TextButton(
                                        onPressed: () {
                                          print('all product');

                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    AllProductScreen(
                                                        id: snapshot
                                                            .data![index].id)),
                                          );
                                        },
                                        child: Text(
                                          snapshot.data![index].nameEn,
                                          style: GoogleFonts.nunito(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 12,
                                              color: Colors.black),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        '${snapshot.data![index].productsCount} Product',
                                        style: GoogleFonts.nunito(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 11,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    },
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
