import 'dart:io';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DbController {
  late Database _database;
  static DbController? _instance;

  Database get database => _database;

  DbController._();

  factory DbController() {
    return _instance ??= DbController._();
  }

  Future<void> initDatabase() async {
    Directory directory = await getApplicationDocumentsDirectory();
    String path = join(directory.path, 'app_db.sql');
    _database = await openDatabase(
      path,
      version: 1,
      onOpen: (Database database) {},
      onCreate: (Database database, int version) async {
        await database.execute('CREATE TABLE carts ('
            'id INTEGER PRIMARY KEY AUTOINCREMENT,'
            'product_id NUMERIC NOT NULL,'
            'user_id NUMERIC NOT NULL,'
            'name_en TEXT NOT NULL,'
            'image TEXT NOT NULL,'
            'price REAL,'
            'total_price REAL,'
            'quantity NUMERIC'
            ')');
      },
      onUpgrade: (Database db, int oldVersion, int newVersion) {},
      onDowngrade: (Database db, int oldVersion, int newVersion) {},
    );
  }
}
