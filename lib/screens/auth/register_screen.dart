import 'package:ecommerce_project_api/api/controllers/city_api_controller.dart';

import 'package:ecommerce_project_api/models/city.dart';
import 'package:ecommerce_project_api/models/user.dart';

import 'package:ecommerce_project_api/widgets/text_filed.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ecommerce_project_api/api/controllers/auth_api_controller.dart';
import 'package:ecommerce_project_api/models/api_response.dart';
import 'package:ecommerce_project_api/utlis/helpers.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> with Helpers {
  CityApiController controller = Get.put(CityApiController());
  late TextEditingController _fullNameTextController;
  late TextEditingController _mobileTextController;
  late TextEditingController _passwordTextController;
  City? city;
  String _gender = 'M';
   String? _selectedFc;

  @override
  void initState() {
    super.initState();
    _fullNameTextController = TextEditingController();
    _mobileTextController = TextEditingController();
    _passwordTextController = TextEditingController();
  }

  @override
  void dispose() {
    _fullNameTextController.dispose();
    _mobileTextController.dispose();
    _passwordTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(vertical: 22.r),
              child: Image(
                width: 156.w,
                height: 100.w,
                image: const AssetImage("images/logo.png"),
                color: Colors.black,
              ),
            ),
            Text(
              'Sign Up',
              style:
                  GoogleFonts.actor(fontWeight: FontWeight.w600, fontSize: 20),
            ),
            Text(
              'Create an new account',
              style: GoogleFonts.actor(
                fontWeight: FontWeight.w400,
                color: const Color(0xFF666666),
                fontSize: 14,
              ),
            ),
            const SizedBox(height: 20),
            TextFieldWidget(
                controller: _fullNameTextController,
                textInputType: TextInputType.name,
                hint: 'Name',
                iconData: Icons.person,
                iconDataSuffix: Icons.check_circle,
                obscure: false),
            const SizedBox(height: 10),
            TextFieldWidget(
                controller: _mobileTextController,
                textInputType: TextInputType.phone,
                hint: 'Mobile',
                iconData: Icons.phone,
                iconDataSuffix: Icons.check_circle,
                obscure: false),
            const SizedBox(height: 10),
            TextFieldWidget(
                controller: _passwordTextController,
                textInputType: TextInputType.visiblePassword,
                hint: 'Password',
                iconData: Icons.lock,
                iconDataSuffix: Icons.check_circle,
                obscure: true),
            const SizedBox(height: 10),
            Row(
              children: [
                Expanded(
                  child: RadioListTile(
                    title: const Text('Male'),
                    value: 'M',
                    groupValue: _gender,
                    onChanged: (String? value) {
                      if (value != null) {
                        setState(() => _gender = value);
                      }
                    },
                  ),
                ),
                Expanded(
                  child: RadioListTile(
                    title: const Text('Female'),
                    value: 'F',
                    groupValue: _gender,
                    onChanged: (String? value) {
                      if (value != null) {
                        setState(() => _gender = value);
                      }
                    },
                  ),
                ),
              ],
            ),

            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                    child: FutureBuilder<List<City>>(
                      future: CityApiController().getCities(),
                      builder: (context, snapshot) {
                        if (snapshot.hasData && snapshot.data!.isNotEmpty) {
                          return DropdownButton<String>(
                              hint: Text("Select"),
                              value: _selectedFc,
                              onChanged: (newValue) {
                                setState(() {
                                  _selectedFc = newValue;
                                  print(_selectedFc);
                                });
                              },
                              items: snapshot.data!.map((fc) =>
                                  DropdownMenuItem<String>(
                                    child: Text(fc.nameEn),
                                    value: fc.id.toString() ,

                                  )
                              ).toList()
                          );
                          // ListView.builder(
                          //   scrollDirection: Axis.vertical,
                          //   shrinkWrap: true,
                          //   itemCount: snapshot.data!.length,
                          //   itemBuilder: (context, index) {
                          //     return ListTile(
                          //       title: Text(snapshot.data![index].nameEn),
                          //
                          //     );
                          //   },
                          // );
                        }else{return const Center(child: Text('no data'),); }
                      },
                    ),
                    // child: DropdownButtonHideUnderline(
                    //   child: ButtonTheme(
                    //     alignedDropdown: true,
                    //     child: DropdownButton<String>(
                    //       value: _myState,
                    //       iconSize: 30,
                    //       icon: (null),
                    //       style: TextStyle(
                    //         color: Colors.black54,
                    //         fontSize: 16,
                    //       ),
                    //       hint: Text('Select State'),
                    //       // onChanged: (String newValue) {
                    //       //   setState(() {
                    //       //     _myState = newValue;
                    //       //     _getCitiesList();
                    //       //     print(_myState);
                    //       //   });
                    //       // },
                    //       items: statesList?.map((item) {
                    //         return new DropdownMenuItem(
                    //           child: new Text(item['name']),
                    //           value: item['id'].toString(),
                    //         );
                    //       })?.toList() ??
                    //           [],
                    //     ),
                    //   ),
                    // ),

                  // child: FutureBuilder<List<City>>(
                  //   future: CityApiController().getCities(),
                  //   builder: (context, snapshot) {
                  //     print(snapshot);
                  //     if (snapshot.connectionState == ConnectionState.waiting) {
                  //       return const Center(child: CircularProgressIndicator());
                  //     } else if (snapshot.hasData && snapshot.data!.isNotEmpty) {
                  //       return ListView.builder(
                  //         scrollDirection: Axis.vertical,
                  //         shrinkWrap: true,
                  //         itemCount: snapshot.data!.length,
                  //         itemBuilder: (context, index) {
                  //           return ListTile(
                  //             title: Text(snapshot.data![index].nameEn),
                  //
                  //           );
                  //         },
                  //       );
                  //     } else {
                  //       return Center(
                  //         child: Text(
                  //           'NO DATA',
                  //           style: GoogleFonts.montserrat(
                  //             fontSize: 23,
                  //             fontWeight: FontWeight.bold,
                  //             color: Colors.grey.shade700,
                  //           ),
                  //         ),
                  //       );
                  //     }
                  //   },
                  // ),
                ),
              ),
            ),

            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async => await _performRegister(),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blueGrey,
                minimumSize: Size(double.infinity, 50.r),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: const Text('REGISTER'),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _performRegister() async {
    if (_checkData()) {
      await _register();
    }
  }

  bool _checkData() {
    if (_fullNameTextController.text.isNotEmpty &&
        _mobileTextController.text.isNotEmpty &&
        _passwordTextController.text.isNotEmpty) {
      return true;
    }
    showSnackBar(context, message: 'Enter required data!', error: true);
    return false;
  }

  Future<void> _register() async {
    ApiResponse apiResponse = await AuthApiController().register(user: user);
    if (apiResponse.success) Navigator.pushReplacementNamed(context, '/activate_screen');
    showSnackBar(context,
        message: apiResponse.message, error: !apiResponse.success);
  }

  User get user {
    User user = User();
    user.name = _fullNameTextController.text;
    user.mobile = _mobileTextController.text;
    user.password = _passwordTextController.text;
    user.gender = _gender;
    user.cityId = _selectedFc!;
    return user;
  }
}
