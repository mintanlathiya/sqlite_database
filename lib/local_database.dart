import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqlite_database/user_modal.dart';

class LocalDatabase {
  static const String _userDb = 'user.db';
  static const String _userMst = 'user_mst';

  static Future<Database> get openDb async {
    return await openDatabase(
      join(await getDatabasesPath(), _userDb),
      version: 1,
      onCreate: (db, version) => db.execute(
          'CREATE TABLE $_userMst( id INTEGER PRIMARY KEY, userName TEXT NOT NULL)'),
    );
  }

  static Future<void> insertData(User user) async {
    final db = await openDb;
    db.insert(_userMst, user.toJson(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  static Future<List<User>> selectData() async {
    final db = await openDb;
    List<Map<String, dynamic>> data = await db.query(_userMst);
    //log('$data');
    return List.generate(data.length, (index) => User.fromJson(data[index]));
  }

  static Future<void> updateData(User user) async {
    final db = await openDb;
    db.update(_userMst, user.toJson(), where: 'id=?', whereArgs: [user.id]);
  }

  static Future<void> deleteData(int id) async {
    final db = await openDb;
    db.delete(_userMst, where: 'id=?', whereArgs: [id]);
  }
}
