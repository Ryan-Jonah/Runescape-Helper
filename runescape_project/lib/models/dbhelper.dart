import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';

import 'players.dart';

class DBHelper {
  static final _dbName = 'runescape.db';
  static final _version = 1;

  static final table = 'player_history';
  static final colId = 'id';
  static final colName = 'name';

  DBHelper._privateConstructor();
  static final DBHelper instance = DBHelper._privateConstructor();

  static Database _database;
  Future<Database> get database async {
    if (_database != null) return _database;
    _database = await _initDatabase();
    return _database;
  }

  _initDatabase() async {
    Directory docDirectory = await getApplicationDocumentsDirectory();
    String path = join(docDirectory.path, _dbName);
    return await openDatabase(path, version: _version, onCreate: _onCreate);
  }

  Future _onCreate(Database db, int version) async {
    await db.execute('''
    CREATE TABLE $table(
    $colId INTEGER PRIMARY KEY AUTOINCREMENT,
    $colName TEXT NOT NULL
    )
    ''');
  }

  Future<int> insert(Map<String, dynamic> row) async {
    Database db = await instance.database;
    return await db.insert(table, row);
  }

  Future<List<Map<String, dynamic>>> queryAllRows() async {
    Database db = await instance.database;
    return await db.query(table);
  }

  Future<List<Map<String, dynamic>>> queryAllUsers() async {
    Database db = await instance.database;
    return await db.rawQuery("SELECT * FROM $table ORDER BY lname DESC");
  }

  Future<List<Map<String, dynamic>>> queryAllRowsById(id) async {
    Database db = await instance.database;
    return await db.query(table, where: "$colId = $id");
  }

  Future<int> updateEmployee(Players employee) async {
    Database db = await instance.database;
    int id = employee.toMap()['id'];
    return await db
        .update(table, employee.toMap(), where: '$colId = ?', whereArgs: [id]);
  }

  Future<int> delete(int id) async {
    Database db = await instance.database;
    return await db.delete(table, where: '$colId = ?', whereArgs: [id]);
  }

  Future<List<Map<String, dynamic>>> queryByName(name) async {
    Database db = await instance.database;
    return await db.query(table, where: "$colName LIKE '%$name%'");
  }
}
