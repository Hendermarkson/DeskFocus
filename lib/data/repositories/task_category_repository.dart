import 'package:desk_focus/data/database/dao/task_category_dao.dart';
import 'package:desk_focus/models/entities/task_category.dart';

class TaskCategoryRepository {
  final _dbDao = TaskCategoriesDao();

  Future<int> addtaskCategory(TaskCategory category) =>
      _dbDao.addtaskCategory(category);

  Future<int> updateTaskCategory(TaskCategory category) =>
      _dbDao.updateTaskCategory(category);

  Future<int> deleteTaskCategory(int id) => _dbDao.deleteTaskCategory(id);

  Future<List<TaskCategory>> getTaskCategories() => _dbDao.getTaskCategories();
}
