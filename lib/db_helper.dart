import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static const _databaseName = 'saegis.db';
  static const _databaseVersion = 1;
  static const tableUser = 'user';
  static const tableItem = 'item';

  DatabaseHelper._privateConstructor();

  static final DatabaseHelper _instance = DatabaseHelper._privateConstructor();

  factory DatabaseHelper() {
    return _instance;
  }

  final String _userCreate = 'CREATE TABLE $tableUser(id TEXT PRIMARY KEY, title TEXT NOT NULL, name TEXT NOT NULL, address TEXT, age REAL NOT NULL)';
  final String _itemCreate = 'CREATE TABLE $tableItem(id TEXT PRIMARY KEY, name TEXT NOT NULL, price REAL NOT NULL, quantity REAL NOT NULL)';

  static Database? _database;

  Future<Database> _initDatabase() async {
    String path = await getDatabasesPath();
    return openDatabase(join(path, _databaseName), onCreate: (database, version) async {
      await database.execute(_userCreate);
      await database.execute(_itemCreate);
    }, version: _databaseVersion);
  }

  Future<Database?> get database async {
    if (_database != null) {
      return _database;
    }
    _database = await _initDatabase();
    return _database;
  }
}
