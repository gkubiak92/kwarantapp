import 'dart:async';

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DbUtils {
  static const dbName = 'kwarantapp.db';
  Database _db;

  Future<Database> get db async {
    var dbPath = await getDatabasesPath();
    _db = await openDatabase(join(dbPath, dbName), onCreate: (db, version) {
      String sql =
          'CREATE TABLE measurement(id INTEGER PRIMARY KEY, date DATE, cough INTEGER, fever INTEGER, shortnessOfBreath INTEGER';
      return db.execute(sql);
    });
    return null;
  }
}
