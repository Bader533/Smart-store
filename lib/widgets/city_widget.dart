import 'package:flutter/material.dart';
import 'package:ecommerce_project_api/models/city.dart';

class CityWidget extends StatelessWidget {
  final City city;
  final void Function() onTap;

  CityWidget({required this.city, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        color: Colors.white,
        padding: EdgeInsets.symmetric(vertical: 20),
        child: Row(
          children: [
            Text(city.nameEn),
          ],
        ),
      ),
    );
  }
}
