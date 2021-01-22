import 'package:desk_focus/data/database/database.dart';
import 'package:desk_focus/models/entities/task_category.dart';

class TaskCategoryDbDao {
  final dbProvider = DBProvider.provider;

  Future<TaskCategory> getTaskCategory(int id) async {
    final db = await dbProvider.database;
    var res =
        await db.query(taskCategoryTable, where: 'id = ?', whereArgs: [id]);
    return res.isNotEmpty ? TaskCategory.fromJson(res.first) : Null;
  }

  Future<List<TaskCategory>> getTaskCategories() async {
    final db = await dbProvider.database;
    var res = await db.query(taskCategoryTable);
    return res.isNotEmpty
        ? res.map((t) => TaskCategory.fromJson(t)).toList()
        : [];
  }
}
