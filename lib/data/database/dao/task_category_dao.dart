import 'package:desk_focus/data/database/dao/base_dao.dart';
import 'package:desk_focus/data/database/database.dart';
import 'package:desk_focus/models/entities/task_category.dart';

class TaskCategoriesDao extends BaseDao {
  final dbProvider = DBProvider.provider;

  TaskCategoriesDao() : super(taskCategoryTable);

  Future<int> addtaskCategory(TaskCategory category) async {
    return await create(category.toJson());
  }

  Future<TaskCategory> getTaskCategory(int id) async {
    var result = await getOne(id);
    return result == null ? null : TaskCategory.fromJson(result);
  }

  Future<List<TaskCategory>> getTaskCategories() async {
    var result = await getAll();
    return result.isNotEmpty
        ? result.map((t) => TaskCategory.fromJson(t)).toList()
        : [];
  }

  Future<int> updateTaskCategory(TaskCategory category) async {
    return await update(category.toJson());
  }

  Future<int> deleteTaskCategory(int id) async {
    return await delete(id);
  }
}
