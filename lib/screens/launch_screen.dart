// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:ecommerce_project_api/pref/shared_pref_controller.dart';
//
// class LaunchScreen extends StatefulWidget {
//   const LaunchScreen({Key? key}) : super(key: key);
//
//   @override
//   State<LaunchScreen> createState() => _LaunchScreenState();
// }
//
// class _LaunchScreenState extends State<LaunchScreen> {
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     Future.delayed(const Duration(seconds: 3), () {
//       String route = SharedPrefController().loggedIn ? '/users_screen' : '/login_screen';
//       Navigator.pushReplacementNamed(context, route);
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         alignment: AlignmentDirectional.center,
//         decoration: const BoxDecoration(
//           gradient: LinearGradient(
//             begin: AlignmentDirectional.topStart,
//             end: AlignmentDirectional.bottomEnd,
//             colors: [
//               Color(0xFF0078AA),
//               Color(0xFF3AB4F2),
//             ],
//           ),
//         ),
//         child: Text(
//           'API APP',
//           style: GoogleFonts.montserrat(
//             fontWeight: FontWeight.bold,
//             fontSize: 24,
//             color: Color(0xFFF6F6F6),
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:ecommerce_project_api/pref/shared_pref_controller.dart';
import 'package:flutter/material.dart';

class LaunchScreen extends StatefulWidget {
  const LaunchScreen({Key? key}) : super(key: key);

  @override
  State<LaunchScreen> createState() => _LaunchScreenState();
}

class _LaunchScreenState extends State<LaunchScreen> {

  // @override
  // void initState() {
  //   super.initState();
  //   Future.delayed(const Duration(seconds: 3),(){
  //     Navigator.pushReplacementNamed(context, '/on_boarding_screen');
  //   });
  //
  // }
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      String route = SharedPrefController().loggedIn ? '/bottom_navigation_screen' : '/on_boarding_screen';
      Navigator.pushReplacementNamed(context, route);
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("images/Mask_Group_9.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: const [Image(image: AssetImage("images/logo.png"))],
        ),
      ),
    );
  }
}

