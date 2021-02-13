import 'package:desk_focus/data/database/dao/base_dao.dart';
import 'package:desk_focus/data/database/database.dart';
import 'package:desk_focus/models/entities/task.dart';

class TasksDbDao extends BaseDao {
  TasksDbDao() : super(taskTable);

  Future<int> addTask(Task task) async {
    return await create(task.toJson());
  }

  Future<Task> getTask(String id) async {
    var entity = await getOne(id);
    return entity == null ? null : Task.fromJson(entity);
  }

  Future<List<Task>> getTasks() async {
    var result = await getAll();
    return result.isNotEmpty
        ? result.map((t) => Task.fromJson(t)).toList()
        : [];
  }

  Future<int> updateTask(Task task) async {
    return await update(task.toJson());
  }

  Future<int> deleteTask(String id) async {
    return await delete(id);
  }
}
