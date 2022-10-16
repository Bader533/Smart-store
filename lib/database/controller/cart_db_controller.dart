import 'package:ecommerce_project_api/database/db_operations.dart';
import 'package:ecommerce_project_api/models/cart.dart';

class CartDbController with DbOperations<Cart> {
  @override
  Future<int> create(Cart model) async {
    return database.insert(Cart.tableName, model.toMap());
  }

  @override
  Future<bool> delete(int id) async {
    int countOfDeletedRows = await database.delete(Cart.tableName,
        where: 'id = ? AND user_id = ?', whereArgs: [id, userId]);
    return countOfDeletedRows == 1;
  }

  @override
  Future<List<Cart>> read() async {
    print('data is readed');
    List<Map<String, dynamic>> rowsMap = await database
        .query(Cart.tableName, where: 'user_id=?', whereArgs: [userId]);

    return rowsMap.map((rowMap) => Cart.fromMap(rowMap)).toList();
  }

  @override
  Future<Cart?> show(int id) async {
    List<Map<String, dynamic>> rowMap =
        await database.query(Cart.tableName, where: 'id=?', whereArgs: [id]);
    return rowMap.isNotEmpty ? Cart.fromMap(rowMap.first) : null;
  }

  @override
  Future<bool> update(Cart model) async {
    int countOfUpdatedRaw = await database.update(Cart.tableName, model.toMap(),
        where: 'id=?', whereArgs: [model.id]);
    return countOfUpdatedRaw == 1;
  }
}
