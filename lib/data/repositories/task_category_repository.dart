import 'package:desk_focus/data/database/task_category_db_dao.dart';

class TaskCategoryRepository {
  final _dbDao = TaskCategoryDbDao();

  Future getTaskCategories() => _dbDao.getTaskCategories();
}
