import 'package:ecommerce_project_api/api/controllers/product_api_controller.dart';
import 'package:ecommerce_project_api/models/product.dart';
import 'package:ecommerce_project_api/screens/app/product/product_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class AllProductScreen extends StatelessWidget {
  final int id;

  const AllProductScreen({Key? key, required this.id}) : super(key: key);

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
            child: FutureBuilder<List<Product>>(
              future: ProductApiController().getProduct(id: id),
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
                      childAspectRatio: 155 / 244.5,
                    ),
                    itemBuilder: (context, index) {
                      return Card(
                        elevation: 0,
                        color: Colors.transparent,
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Expanded(
                                  child: Image(
                                    image: NetworkImage(
                                      snapshot.data![index].imageUrl,
                                    ),
                                    height: 170,
                                    width: 155,
                                    fit: BoxFit
                                        .fill, //fill type of image inside aspectRatio
                                  ),
                                ),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                      horizontal: 5, vertical: 12)
                                  .r,
                              child: Container(
                                color: Colors.transparent,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    TextButton(
                                      onPressed: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  ProductScreen(
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
                                    SizedBox(
                                      height: 3.h,
                                    ),
                                    Text(
                                      snapshot.data![index].price,
                                      style: GoogleFonts.montserrat(
                                          fontSize: 11.sp,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ],
                                ),
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
