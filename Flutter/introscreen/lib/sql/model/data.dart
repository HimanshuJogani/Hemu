import 'dart:io';

import 'package:introscreen/sql/model/usermodel.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DBHelper {
  DBHelper._();
  static final DBHelper db = DBHelper._();

  static Database? _database;
  static String tableName = "Client";

  Future<Database?> get database async {
    if (_database != null) return _database;

    // if _database is null we instantiate it
    _database = await initDB();
    return _database;
  }

  initDB() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, "TestDB.db");

    return await openDatabase(path, version: 1, onOpen: (db) {},
        onCreate: (Database db, int version) async {
      await db.execute("CREATE TABLE $tableName ("
          "id INTEGER PRIMARY KEY,"
          "first_name TEXT,"
          "last_name TEXT"
          ")");
    });
  }

  newClient(Client newClient) async {
    final db = await database;
    var res = await db?.insert(tableName, newClient.toMap());
    return res;
  }

  getClient(int id) async {
    final db = await database;
    var res = await db?.query(tableName, where: "id =?", whereArgs: [id]);
    return res!.isNotEmpty ? Client.fromMap(res.first) : Null;
  }

  updateClient(Client newClient) async {
    final db = await database;
    var res = await db?.update(tableName, newClient.toMap(),
        where: "id = ?", whereArgs: [newClient.id]);
    return res;
  }

  getAllClients() async {
    final db = await database;
    var res = await db?.query(tableName);
    List<Client> list =
        res!.isNotEmpty ? res.map((c) => Client.fromMap(c)).toList() : [];
    return list;
  }

  deleteClient(int id) async {
    final db = await database;
    db?.delete(tableName, where: "id = ?", whereArgs: [id]);
  }
}
