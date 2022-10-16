import 'package:ecommerce_project_api/models/category.dart';
import 'package:ecommerce_project_api/models/slider.dart';

class Home {
  late String status;
  late String message;
  late Data data;

  Home();

  Home.fromJson(dynamic json) {
    status = json['status'];
    message = json['message'];
    data = Data.fromJson(json['data']);
  }
}

class Data {
  late List<Slider> slider;
  late List<Category> categories;
  late List<LatestProducts> latestProducts;
  late List<FamousProducts> famousProducts;

  Data.fromJson(dynamic json) {
    if (json['slider'] != null) {
      slider = [];
      json['slider'].forEach((v) {
        slider.add(Slider.fromJson(v));
      });
    }
    if (json['categories'] != null) {
      categories = [];
      json['categories'].forEach((v) {
        categories.add(Category.fromJson(v));
      });
    }
    if (json['LatestProducts'] != null) {
      latestProducts = [];
      json['LatestProducts'].forEach((v) {
        latestProducts.add(LatestProducts.fromJson(v));
      });
    }
    if (json['FamousProducts'] != null) {
      famousProducts = [];
      json['FamousProducts'].forEach((v) {
        famousProducts.add(FamousProducts.fromJson(v));
      });
    }
  }
}

class FamousProducts {
  late int id;
  late String nameEn;
  late String nameAr;
  late String infoEn;
  late String infoAr;
  late num price;
  late int quantity;
  late num overalRate;
  late int subCategoryId;
  late double productRate;
  late num offerPrice;
  late bool isFavorite;
  late String imageUrl;

  FamousProducts.fromJson(dynamic json) {
    id = json['id'];
    nameEn = json['name_en'];
    nameAr = json['name_ar'];
    infoEn = json['info_en'];
    infoAr = json['info_ar'];
    price = json['price'];
    quantity = json['quantity'];
    overalRate = json['overal_rate'];
    subCategoryId = json['sub_category_id'];
    // productRate = json['product_rate'];
    if (json['product_rate'].runtimeType == String) {
      productRate = double.parse(json['product_rate']);
    } else {
      productRate = json['product_rate'] * 1.0;
    }

    offerPrice = json['offer_price'];
    isFavorite = json['is_favorite'];
    imageUrl = json['image_url'];
  }
}

class LatestProducts {
  late int id;
  late String nameEn;
  late String nameAr;
  late String infoEn;
  late String infoAr;
  late num price;
  late int quantity;
  late num overalRate;
  late int subCategoryId;
  late double productRate;
  late num offerPrice;
  late bool isFavorite;
  late String imageUrl;

  LatestProducts.fromJson(dynamic json) {
    id = json['id'];
    nameEn = json['name_en'];
    nameAr = json['name_ar'];
    infoEn = json['info_en'];
    infoAr = json['info_ar'];
    price = json['price'];
    quantity = json['quantity'];
    overalRate = json['overal_rate'];
    subCategoryId = json['sub_category_id'];
    // productRate = json['product_rate'];
    if (json['product_rate'].runtimeType == String) {
      productRate = double.parse(json['product_rate']);
    } else {
      productRate = json['product_rate'] * 1.0;
    }
    offerPrice = json['offer_price'];
    isFavorite = json['is_favorite'];
    imageUrl = json['image_url'];
  }
}
