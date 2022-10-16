enum ClientTableKey {
  id,
  quantity,
  productId,
  imageUrl,
  nameEn,
  price,
  totalPrice,
  userId
}

class Cart {
  late int id;
  late int productId;
  late String imageUrl;
  late String nameEn;
  late double price;
  late double totalPrice;
  late int quantity;
  late int userId;
  static const String tableName = 'carts';

  Cart();

  Cart.fromMap(Map<String, dynamic> rowMap) {
    id = rowMap[ClientTableKey.id.name];
    productId = rowMap[ClientTableKey.productId.name];
    imageUrl = rowMap[ClientTableKey.imageUrl.name];
    nameEn = rowMap[ClientTableKey.nameEn.name];
    price = rowMap[ClientTableKey.price.name];
    totalPrice = rowMap[ClientTableKey.totalPrice.name];
    quantity = rowMap[ClientTableKey.quantity.name];
    userId = rowMap[ClientTableKey.userId.name];
  }

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> map = <String, dynamic>{};
    // map['id'] = id;
    map['product_id'] = productId;
    map['quantity'] = quantity;
    map['image'] = imageUrl;
    map['name_en'] = nameEn;
    map['price'] = price;
    map['total_price'] = totalPrice;
    map['user_id'] = userId;
    return map;
  }
}
