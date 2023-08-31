import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:sqlite_database/user_modal.dart';

class LocalDatabase {
  static String _userDb = 'user.db';
  static String _userMst = 'user_mst';

  static Future<Database>  get openDb async{

  return await  openDatabase(join(await  getDatabasesPath(),_userDb),version: 1,onCreate: (db, version) => db.execute('CREATE TABLE $_userMst( id INTEGER PRIMARY KEY, userName TEXT NOT NULL)'),);
  }

  static Future<void> insertData(User user)async{
    final db= await openDb;
    db.insert(_userMst, user.toJson(),
    conflictAlgorithm: ConflictAlgorithm.replace);
  }
}
