import 'package:desk_focus/data/database/dao/task_category_dao.dart';

class TaskCategoryRepository {
  final _dbDao = TaskCategoriesDao();

  Future getTaskCategories() => _dbDao.getTaskCategories();
}
