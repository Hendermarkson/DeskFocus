import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

const taskTable = 'Tasks';

class DBProvider {
  DBProvider._();
  static final DBProvider provider = DBProvider._();

  static Database _database;

  Future<Database> get database async {
    if (_database != null) {
      return _database;
    }

    // if _database is null we instantiate it
    _database = await initDB();
    return _database;
  }

  initDB() async {
    String path = join(await getDatabasesPath(), 'deskfocus.db');
    return await openDatabase(
      path,
      version: 1,
      onOpen: (db) {},
      onCreate: (Database db, int version) async {
        await db.execute(
            'CREATE TABLE $taskTable(id TEXT PRIMARY KEY, name TEXT, isFinished INTEGER)');
      },
    );
  }
}
