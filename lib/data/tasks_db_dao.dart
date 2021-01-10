import 'package:desk_focus/data/database.dart';
import 'package:desk_focus/models/task.dart';

class TasksDbDao {
  final dbProvider = DBProvider.provider;

  addTask(Task task) async {
    final db = await dbProvider.database;
    var res = await db.insert(taskTable, task.toJson());
    return res;
  }

  getTask(int id) async {
    final db = await dbProvider.database;
    var res = await db.query(taskTable, where: 'id = ?', whereArgs: [id]);
    return res.isNotEmpty ? Task.fromJson(res.first) : Null;
  }

  getTasks() async {
    final db = await dbProvider.database;
    var res = await db.query(taskTable);
    return res.isNotEmpty ? res.map((t) => Task.fromJson(t)).toList() : [];
  }

  updateTask(Task task) async {
    final db = await dbProvider.database;
    var res = await db.update(taskTable, task.toJson(),
        where: 'id = ?', whereArgs: [task.id]);
    return res;
  }

  deleteTask(int id) async {
    final db = await dbProvider.database;
    db.delete(taskTable, where: 'id = ?', whereArgs: [id]);
  }
}
