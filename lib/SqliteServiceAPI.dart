import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/services.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'model/items_info_Model.dart';

class SqliteServiceAPI {
  //
  SqliteServiceAPI.init();
  static final SqliteServiceAPI db = SqliteServiceAPI.init();
  //
  static Database _database;

  Future<Database> get database async {
    //if null - create new and !null return this
    if (_database == null) {
      _database = await initDB();
    }
    return _database;
  }

  initDB() async {
    // Directory documentsDirectory = await getApplicationDocumentsDirectory();
    var databasesPath = await getDatabasesPath();
    var path = join(databasesPath, 'database.db');

    // Check if the database exists
    var exists = await databaseExists(path);

    if (!exists) {
      // Should happen only the first time you launch your application
      print("Creating new copy from asset");

      // Make sure the parent directory exists
      try {
        await Directory(dirname(path)).create(recursive: true);
      } catch (_) {
        print(_);
      }

      // Copy from asset
      ByteData data = await rootBundle.load(join('assets', 'database.db'));
      List<int> bytes =
          data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);

      // Write and flush the bytes written
      await File(path).writeAsBytes(bytes, flush: true);
    } else {
      print("Opening existing database");
    }

    return await openDatabase(
      path,
      version: 1,
      readOnly: false,
    );
  }

  Future<List<items_info_Model>> getItemAlls() async {
    var db = await database;
    var listMapCategory = await db.query("items_info");
    List<items_info_Model> ItemAlls = listMapCategory
        .map((json) => items_info_Model().fromJson(json))
        .toList();
    for (var itemPro in ItemAlls) {
      print(itemPro.ii_i_title);
    }
    return ItemAlls;
  }
}
