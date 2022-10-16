class FavoriteProducts {
  late int  id;
  late String  nameEn;
  late String  nameAr;
  late String  infoEn;
  late String  infoAr;
  late String  price;
  late String  quantity;
  late String  overalRate;
  late String  subCategoryId;
  late int  productRate;
  late Null  offerPrice;
  late bool  isFavorite;
  late String  imageUrl;
  // late Pivot  pivot;


  FavoriteProducts.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nameEn = json['name_en'];
    nameAr = json['name_ar'];
    infoEn = json['info_en'];
    infoAr = json['info_ar'];
    price = json['price'];
    quantity = json['quantity'];
    overalRate = json['overal_rate'];
    subCategoryId = json['sub_category_id'];
    productRate = json['product_rate'];
    offerPrice = json['offer_price'];
    isFavorite = json['is_favorite'];
    imageUrl = json['image_url'];
    // pivot = json['pivot'] != null   new Pivot.fromJson(json['pivot']) : null;
  }

}

// class Pivot {
//   String  userId;
//   String  productId;
//
//   Pivot({this.userId, this.productId});
//
//   Pivot.fromJson(Map<String, dynamic> json) {
//     userId = json['user_id'];
//     productId = json['product_id'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['user_id'] = this.userId;
//     data['product_id'] = this.productId;
//     return data;
//   }
// }