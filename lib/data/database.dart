import 'package:desk_focus/models/task.dart';
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
            'CREATE TABLE $taskTable(id INTEGER PRIMARY KEY, name TEXT, isFinished BOOLEAN');
      },
    );
  }

  newTask(Task task) async {
    final db = await database;
    var res = await db.insert(taskTable, task.toJson());
    return res;
  }

  getTask(int id) async {
    final db = await database;
    var res = await db.query(taskTable, where: 'id = ?', whereArgs: [id]);
    return res.isNotEmpty ? Task.fromJson(res.first) : Null;
  }

  getTasks() async {
    final db = await database;
    var res = await db.query(taskTable);
    return res.isNotEmpty ? res.map((t) => Task.fromJson(t)).toList() : [];
  }

  updateTask(Task task) async {
    final db = await database;
    var res = await db.update(taskTable, task.toJson(),
        where: 'id = ?', whereArgs: [task.id]);
    return res;
  }

  deleteTask(int id) async {
    final db = await database;
    db.delete(taskTable, where: 'id = ?', whereArgs: [id]);
  }
}
