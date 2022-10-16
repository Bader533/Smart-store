import 'package:ecommerce_project_api/database/db_controller.dart';
import 'package:ecommerce_project_api/pref/shared_pref_controller.dart';
import 'package:sqflite/sqflite.dart';

mixin DbOperations<Model> {
  final Database database = DbController().database;
  int userId = SharedPrefController().getByKey<int>(key: PrefKeys.id.name)!;

  Future<int> create(Model model);

  Future<List<Model>> read();

  Future<bool> update(Model model);

  Future<bool> delete(int id);

  Future<Model?> show(int id);

  Future<void> clear(String tableName) async {
    await database.delete(tableName, where: 'user_id', whereArgs: [userId]) > 0;
  }
}
