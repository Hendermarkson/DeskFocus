import 'package:desk_focus/data/tasks_db_dao.dart';
import 'package:desk_focus/models/task.dart';

class TasksRepository {
  final dbDao = TasksDbDao();

  Future addTask(Task task) => dbDao.addTask(task);

  Future getTask(int id) => dbDao.getTask(id);

  Future getTasks() => dbDao.getTasks();

  Future updateTask(Task task) => dbDao.updateTask(task);

  Future deleteTask(int id) => dbDao.deleteTask(id);
}
