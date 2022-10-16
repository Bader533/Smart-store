import 'package:ecommerce_project_api/screens/app/category/sub_category.dart';
import 'package:ecommerce_project_api/screens/app/product/product_screen.dart';
import 'package:ecommerce_project_api/utlis/helpers.dart';
import 'package:ecommerce_project_api/widgets/elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ecommerce_project_api/api/controllers/home_api_controller.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HomeScreen extends StatefulWidget with Helpers {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<String> images = [
    "images/Rectangle 20.png",
    "images/Rectangle 19.png",
  ];
  PageController pageController = PageController(viewportFraction: 0.85);

  @override
  Widget build(BuildContext context) {
    Locale myLocale = Localizations.localeOf(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
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
                  Navigator.pushReplacementNamed(context, '/category_screen');
                },
                child: const Icon(
                  Icons.search,
                  size: 26.0,
                  color: Colors.black,
                ),
              )),
        ],
      ),
      body: ListView(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        children: [
          SizedBox(
            height: 210.h,
            child: GridView.builder(
                itemCount: 2,
                padding: const EdgeInsets.symmetric(horizontal: 20).r,
                scrollDirection: Axis.horizontal,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  mainAxisExtent: 260,
                  crossAxisCount: 1,
                  mainAxisSpacing: 4,
                ),
                itemBuilder: (context, index) {
                  return _buildPageItem(index);
                }),
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 25.0, vertical: 8.0).r,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  AppLocalizations.of(context)!.categories,
                  style: GoogleFonts.montserrat(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TextButton(
                    onPressed: () {
                      Navigator.pushReplacementNamed(
                          context, '/category_screen');
                    },
                    child: Text(
                      AppLocalizations.of(context)!.view_all,
                      style: GoogleFonts.montserrat(
                        fontSize: 11.sp,
                        fontWeight: FontWeight.w600,
                        color: const Color(0xFF666666),
                      ),
                    )),
              ],
            ),
          ),
          FutureBuilder<HomeModel?>(
            future: HomeApiController().read(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return SizedBox(
                  height: 50,
                  child: ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    shrinkWrap: false,
                    itemCount: snapshot.data!.categories.length,
                    padding: const EdgeInsets.symmetric(horizontal: 25).r,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
                        child: Container(
                          width: 100,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(35),
                              color: Colors.white54,
                              border: Border.all(
                                color: const Color(0xFFCCCCCC),
                              )),
                          child: Column(
                            children: [
                              TextButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => SubCategoryScreen(
                                            id: snapshot
                                                .data!.categories[index].id)),
                                  );
                                },
                                child: Text(
                                  // snapshot.data!.categories[index].nameEn,
                                  myLocale.languageCode == 'ar'
                                      ? snapshot.data!.categories[index].nameAr
                                      : snapshot.data!.categories[index].nameEn,
                                  style: GoogleFonts.montserrat(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 13,
                                    color: Colors.black,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ],
                          ),
                          // ),
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
          SizedBox(
            height: 32.h,
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 25.0, vertical: 8.0).r,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  AppLocalizations.of(context)!.new_arrivals,
                  style: GoogleFonts.montserrat(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  AppLocalizations.of(context)!.view_all,
                  style: GoogleFonts.montserrat(
                    fontSize: 11.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8.0).r,
            child: FutureBuilder<HomeModel?>(
              future: HomeApiController().read(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return GridView.builder(
                    shrinkWrap: true,
                    itemCount: snapshot.data!.famousProducts.length,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 8,
                      crossAxisSpacing: 8,
                      childAspectRatio: 155 / 270.5,
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
                                    image: NetworkImage(snapshot
                                        .data!.famousProducts[index].imageUrl),
                                    height: 170,
                                    width: 155,
                                    fit: BoxFit
                                        .fill, //fill type of image inside aspectRatio
                                  ),
                                ),
                              ],
                            ),
                            Container(
                              color: Colors.transparent,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  TextButton(
                                    onPressed: () {
                                      // print('all product');
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => ProductScreen(
                                                id: snapshot.data!
                                                    .famousProducts[index].id)),
                                      );
                                    },
                                    child: Text(
                                      // snapshot
                                      //     .data!.famousProducts[index].nameEn,
                                      myLocale.languageCode == 'ar'
                                          ? snapshot.data!.famousProducts[index]
                                              .nameAr
                                          : snapshot.data!.famousProducts[index]
                                              .nameEn,
                                      style: GoogleFonts.montserrat(
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 3.h,
                                  ),
                                  Text(
                                    'Traveler Tote',
                                    style: GoogleFonts.montserrat(
                                        fontSize: 11.sp,
                                        fontWeight: FontWeight.w400),
                                  ),
                                  SizedBox(
                                    height: 8.5.h,
                                  ),
                                  Text(
                                    snapshot.data!.famousProducts[index].price,
                                    style: GoogleFonts.montserrat(
                                        fontSize: 11.sp,
                                        fontWeight: FontWeight.w600),
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
          SizedBox(
            height: 32.h,
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 25.0, vertical: 10).r,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  AppLocalizations.of(context)!.latest_product,
                  style: GoogleFonts.montserrat(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  AppLocalizations.of(context)!.view_all,
                  style: GoogleFonts.montserrat(
                    fontSize: 11.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 15.0, vertical: 11.0),
            child: FutureBuilder<HomeModel?>(
              future: HomeApiController().read(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return ListView.builder(
                    shrinkWrap: true,
                    itemCount: snapshot.data!.latestProducts.length,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return Card(
                        elevation: 4,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: ListTile(
                          leading: CircleAvatar(
                            backgroundImage: NetworkImage(
                                snapshot.data!.latestProducts[index].imageUrl),
                          ),
                          title:TextButton(
                            onPressed: () {
                              // print('all product');
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ProductScreen(
                                        id: snapshot.data!
                                            .latestProducts[index].id)),
                              );
                            },
                            child: Text(
                              // snapshot
                              //     .data!.famousProducts[index].nameEn,
                              myLocale.languageCode == 'ar'
                                  ? snapshot.data!.latestProducts[index].nameAr
                                  : snapshot.data!.latestProducts[index].nameEn,
                              style: GoogleFonts.montserrat(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w600,
                                color: Colors.black,
                              ),
                            ),
                          ),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text('RHW Rosie 1 Sandals'),
                              Row(
                                children: const [
                                  Icon(
                                    Icons.star,
                                    color: Color(0xFFFFAB07),
                                  ),
                                  Text('4.7'),
                                ],
                              ),
                            ],
                          ),
                          trailing:
                              Text(snapshot.data!.latestProducts[index].price),
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

  Widget _buildPageItem(int index) {
    return Stack(
      children: [
        Container(
          width: 288.w,
          height: 165.w,
          margin: const EdgeInsets.only(left: 15, right: 10).r,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30.r),
            color: index.isEven
                ? const Color(0xFF69c5df)
                : const Color(0xFF9294cc),
            image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage(
                images[index],
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(15.0).r,
          child: Container(
            width: 167,
            height: 118,
            padding: const EdgeInsets.only(left: 10),
            color: Colors.transparent,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '50% Off',
                  style: GoogleFonts.montserrat(
                      fontSize: 25.sp, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 3.h,
                ),
                Text(
                  'On everything today',
                  style: GoogleFonts.montserrat(
                      fontSize: 16.sp, fontWeight: FontWeight.w400),
                ),
                SizedBox(
                  height: 8.5.h,
                ),
                Text(
                  'With code: rikafashion2021',
                  style: GoogleFonts.montserrat(
                      fontSize: 11.sp, fontWeight: FontWeight.w600),
                ),
                ElevateButton(
                    onPressed: () {},
                    width: 70.w,
                    height: 25.w,
                    primaryColor: const Color(0xFF000000),
                    textButton: 'Get Now',
                    textColor: const Color(0xFFFFFFFF))
              ],
            ),
          ),
        ),
      ],
    );
  }
}
