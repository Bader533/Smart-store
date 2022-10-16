import 'package:ecommerce_project_api/screens/app/bottom_navigation/cart_screen.dart';
import 'package:ecommerce_project_api/screens/app/bottom_navigation/home_screen.dart';
import 'package:ecommerce_project_api/screens/app/bottom_navigation/notify_screen.dart';
import 'package:ecommerce_project_api/screens/app/bottom_navigation/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ecommerce_project_api/models/bn_screen.dart';

class BottomNavigationScreen extends StatefulWidget {
  const BottomNavigationScreen({Key? key}) : super(key: key);

  @override
  State<BottomNavigationScreen> createState() => _BottomNavigationScreenState();
}

class _BottomNavigationScreenState extends State<BottomNavigationScreen> {
  int _currentIndex = 0;
  final List<BnScreen> _bnScreens = <BnScreen>[
    const BnScreen(widget: HomeScreen(), title: 'Home'),
    const BnScreen(widget: CartScreen(), title: 'Cart'),
    const BnScreen(widget: NotifyScreen(), title: 'Notify'),
    const BnScreen(widget: ProfileScreen(), title: 'Profile'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _bnScreens[_currentIndex].widget,
      bottomNavigationBar: BottomNavigationBar(
          onTap: (int currentIndex) {
            setState(() => _currentIndex = currentIndex);
          },
          currentIndex: _currentIndex,
          type: BottomNavigationBarType.shifting,
          showSelectedLabels: true,
          showUnselectedLabels: false,
          fixedColor: Colors.black,
          items: [
            BottomNavigationBarItem(
              icon: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.home,
                    color: Colors.black,
                  ),
                  SizedBox(
                    width: 5.r,
                  ),
                  Text(_currentIndex == 0 ? 'Home' : '',
                      style: GoogleFonts.montserrat(
                          fontSize: 11, fontWeight: FontWeight.w600)),
                ],
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.shopping_cart,
                    color: Colors.black,
                  ),
                  SizedBox(
                    width: 5.r,
                  ),
                  Text(_currentIndex == 1 ? 'Cart' : '',
                      style: GoogleFonts.montserrat(
                          fontSize: 11, fontWeight: FontWeight.w600)),
                ],
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.notifications,
                    color: Colors.black,
                  ),
                  Text(
                    _currentIndex == 2 ? 'Notify' : '',
                    style: GoogleFonts.montserrat(
                        fontSize: 11, fontWeight: FontWeight.w600),
                  ),
                ],
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.person,
                    color: Colors.black,
                  ),
                  SizedBox(
                    width: 5.r,
                  ),
                  Text(_currentIndex == 3 ? 'Profile' : '',
                      style: GoogleFonts.montserrat(
                          fontSize: 11, fontWeight: FontWeight.w600)),
                ],
              ),
              label: '',
            ),
          ]),
    );
  }
}
