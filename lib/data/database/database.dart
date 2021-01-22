import 'dart:math';
import 'package:desk_focus/data/database/migration.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

const taskTable = 'Tasks';
const taskCategoryTable = 'TaskCategories';

const initScripts = [
  'CREATE TABLE $taskTable(id TEXT PRIMARY KEY, name TEXT, isFinished INTEGER, finishedDateTime TEXT, categoryId INTEGER REFERENCES $taskCategoryTable(id))',
  'CREATE TABLE $taskCategoryTable(id INTEGER PRIMARY KEY, name TEXT, color TEXT, icon TEXT)',
  'INSERT INTO $taskCategoryTable (name, color, icon) VALUES (\'None\',\'0x00000000\', null), (\'Personal\',\'0xFF136EF2\', \'account_circle\'),(\'Work\',\'0xFFF21336\', \'work\')'
];

const List<Migration> migrationScripts = [];

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
      version: migrationScripts.isEmpty
          ? 1
          : migrationScripts
              .map((migration) => (migration.version))
              .reduce(max),
      onOpen: (db) {},
      onCreate: (Database db, int version) async {
        initScripts.forEach((script) async => await db.execute(script));
      },
      onUpgrade: (Database db, int oldVersion, int newVersion) async {
        for (var i = oldVersion - 1; i <= newVersion - 1; i++) {
          final migrations = migrationScripts
              .where((migration) => migration.version == i)
              .toList();
          migrations
              .forEach((migration) async => await db.execute(migration.script));
        }
      },
    );
  }
}
