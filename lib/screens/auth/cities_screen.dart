import 'package:ecommerce_project_api/api/controllers/city_api_controller.dart';
import 'package:ecommerce_project_api/getx/cities_getx_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ecommerce_project_api/widgets/city_widget.dart';


class CitiesScreen extends StatelessWidget {
  CityApiController controller = Get.put(CityApiController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        clipBehavior: Clip.antiAlias,
        margin: EdgeInsetsDirectional.only(
            top: 100, start: 20, end: 20, bottom: 20),
        padding: EdgeInsets.symmetric(
          horizontal: 20,
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(25),
          boxShadow: <BoxShadow>[
            BoxShadow(
              offset: Offset(0, 10),
              color: Colors.black.withOpacity(0.16),
              blurRadius: 18,
              spreadRadius: 0,
            ),
          ],
        ),
        child: GetX<CityGetxController>(
          builder: (CityGetxController controller) {
            return controller.cities.isEmpty
                ? Center(child: CircularProgressIndicator(),)
                : ListView.separated(
                    padding: EdgeInsets.zero,
                    shrinkWrap: true,
                    itemCount: controller.cities.length,
                    itemBuilder: (context, index) {
                      return CityWidget(
                        city: controller.cities[index],
                        onTap: () => Get.back(result: controller.cities[index]),
                      );
                    },
                    separatorBuilder: (context, index) {
                      return Divider(
                        height: 0,
                        color: Colors.grey,
                      );
                    },
                  );
          },
        ),
      ),
    );
  }
}
