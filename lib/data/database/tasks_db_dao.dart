import 'package:desk_focus/data/database/database.dart';
import 'package:desk_focus/models/entities/task.dart';

class TasksDbDao {
  final dbProvider = DBProvider.provider;

  Future<int> addTask(Task task) async {
    final db = await dbProvider.database;
    return await db.insert(taskTable, task.toJson());
  }

  Future<Task> getTask(String id) async {
    final db = await dbProvider.database;
    var res = await db.query(taskTable, where: 'id = ?', whereArgs: [id]);
    return res.isNotEmpty ? Task.fromJson(res.first) : Null;
  }

  Future<List<Task>> getTasks() async {
    final db = await dbProvider.database;
    var res = await db.query(taskTable);
    return res.isNotEmpty ? res.map((t) => Task.fromJson(t)).toList() : [];
  }

  Future<int> updateTask(Task task) async {
    final db = await dbProvider.database;
    return await db.update(taskTable, task.toJson(),
        where: 'id = ?', whereArgs: [task.id]);
  }

  Future<int> deleteTask(String id) async {
    final db = await dbProvider.database;
    return db.delete(taskTable, where: 'id = ?', whereArgs: [id]);
  }
}
