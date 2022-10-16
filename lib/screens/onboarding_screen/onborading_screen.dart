import 'package:ecommerce_project_api/widgets/on_boarding_content.dart';
import 'package:ecommerce_project_api/widgets/on_boarding_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  int _currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      // body: SafeArea(
      body: Column(
        children: [
          Expanded(
            child: PageView(
              physics: const BouncingScrollPhysics(),
              onPageChanged: (int pageIndex) {
                setState(() {
                  _currentPageIndex = pageIndex;
                });
              },
              children: const [
                OnBoardingContent(
                  image: 'Onboarding 01',
                  title: '20% Discount New Arrival Product',
                  subTitle:
                      'Publish up your selfies to make yourself more beautiful with this app.',
                ),
                OnBoardingContent(
                  image: 'Onboarding 02',
                  title: 'Take Advantage Of The Offer Shopping',
                  subTitle:
                      'Publish up your selfies to make yourself more beautiful with this app.',
                ),
                OnBoardingContent(
                  image: 'Onboarding 03',
                  title: 'All Types Offers Within Your Reach',
                  subTitle:
                      'Publish up your selfies to make yourself more beautiful with this app.',
                ),
              ],
            ),
          ),

          // Padding(
          //   padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5).r,
            Row(
              // mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  // padding: const EdgeInsets.all(8.0),
                  padding: const EdgeInsets.symmetric(horizontal: 18,vertical: 10).r,
                  child: Column(
                    children: [
                      Row(
                        children: [
                          OnBoardingIndicator(
                            isSelected: _currentPageIndex == 0,
                            marginEnd: 7,
                          ),
                          OnBoardingIndicator(
                            isSelected: _currentPageIndex == 1,
                            marginEnd: 7,
                          ),
                          OnBoardingIndicator(isSelected: _currentPageIndex == 2),
                        ],
                      ),
                    ],
                  ),
                ),
                // Expanded(
                Padding(
                    padding: const EdgeInsets.only(left: 245,bottom: 10).r,

                    child: Column(
                      children: [
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            fixedSize: Size(60.sp, 60.sp),
                            shape: const CircleBorder(),
                            primary: const Color(0xFF000000),
                          ),
                          onPressed: () {
                            Navigator.pushReplacementNamed(
                                context, '/splash_screen');
                          },
                          child: Image.asset('images/Vector.png'),
                        ),
                      ],
                    ),
                  ),

              ],
            ),
          // ),
        ],
      ),
      // ),
    );
  }
}

//--------------------------------------------------------------

//
// floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
// floatingActionButton: Stack(
// fit: StackFit.expand,
// children: [
// Positioned(
// left: 30,
// bottom: 20,
// child: FloatingActionButton(
// heroTag: 'back',
// onPressed: () {/* Do something */},
// child: const Icon(
// Icons.arrow_left,
// size: 40,
// ),
// shape: RoundedRectangleBorder(
// borderRadius: BorderRadius.circular(10),
// ),
// ),
// ),
// Positioned(
// bottom: 20,
// right: 30,
// child: FloatingActionButton(
// heroTag: 'next',
// onPressed: () {/* Do something */},
// child: const Icon(
// Icons.arrow_right,
// size: 40,
// ),
// shape: RoundedRectangleBorder(
// borderRadius: BorderRadius.circular(10),
// ),
// ),
// ),
// // Add more floating buttons if you want
// // There is no limit
// ],
// ),
