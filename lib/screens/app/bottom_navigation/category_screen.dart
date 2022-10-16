import 'package:ecommerce_project_api/screens/app/category/sub_category.dart';
import 'package:ecommerce_project_api/utlis/helpers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ecommerce_project_api/models/category.dart';
import 'package:ecommerce_project_api/api/controllers/category_api_controller.dart';
import 'package:google_fonts/google_fonts.dart';

class CategoryScreen extends StatefulWidget with Helpers {
  CategoryScreen({Key? key}) : super(key: key);

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: GestureDetector(
          child: const Icon(Icons.arrow_circle_left,
              color: Colors.black, size: 35),
          onTap: () {
            Navigator.pushNamed(context, '/bottom_navigation_screen');
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
            child: FutureBuilder<List<Category>>(
              future: CategoryApiController().read(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return GridView.builder(
                    shrinkWrap: true,
                    itemCount: snapshot.data!.length,
                    padding: const EdgeInsets.all(5).r,
                    physics: const BouncingScrollPhysics(),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 10,
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
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    SubCategoryScreen(
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
