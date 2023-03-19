import 'package:flutter/foundation.dart';
import 'package:sqflite/sqflite.dart' as sql;

class SQLHelper {
  static Future<void> createTables(sql.Database database) async {
    await database.execute("""CREATE TABLE companies(
      id INTEGER PRIMARY KEY NOT NULL,
      Cname TEXT,
      C_address TEXT,
      Examin_date TEXT,
      Changes TEXT,
      createdAt TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP

    ) """);
  }

  static Future<sql.Database> db() async {
    return sql.openDatabase(
      'LDOA.db',
      version: 1,
      onCreate: (sql.Database database, int version) async {
        await createTables(database);
      },
    );
  }

  static Future<int> createItem(String Cname, String C_address,
      String Examin_date, String Changes) async {
    final db = await SQLHelper.db();

    final data = {
      'Cname': Cname,
      'C_address': C_address,
      'Examin_date': Examin_date,
      'Changes': Changes
    };

    final id = await db.insert('companies', data,
        conflictAlgorithm: sql.ConflictAlgorithm.replace);
    return id;
  }

  static Future<List<Map<String, dynamic>>> getItems() async {
    final db = await SQLHelper.db();
    return db.query('companies', orderBy: "id");
  }
}
