import 'package:desk_focus/data/database/dao/tasks_dao.dart';
import 'package:desk_focus/models/entities/task.dart';

class TasksRepository {
  final _dbDao = TasksDao();

  Future addTask(Task task) => _dbDao.addTask(task);

  Future getTask(String id) => _dbDao.getTask(id);

  Future getTasks() => _dbDao.getTasks();

  Future updateTask(Task task) => _dbDao.updateTask(task);

  Future deleteTask(String id) => _dbDao.deleteTask(id);
}
