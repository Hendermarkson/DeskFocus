import 'dart:collection';

import 'package:desk_focus/data/repositories/tasks_repository.dart';
import 'package:desk_focus/enums/loading_state.dart';
import 'package:desk_focus/models/entities/task_category.dart';
import 'package:desk_focus/services/categories_data_service.dart';
import 'package:flutter/material.dart';
import 'base_data_service.dart';
import '../models/entities/task.dart';

class TasksDataService extends ChangeNotifier implements BaseDataService {
  List<Task> _tasks = [];

  final TasksRepository tasksRepo;
  final CategoriesDataService categoriesDataService;

  UnmodifiableListView<Task> get tasks {
    var tasksWithCategories = _tasks;
    var categories = _getCategories();
    tasksWithCategories = _tasks.map((t) {
      var category = categories.firstWhere((x) => x.id == t.categoryId,
          orElse: () => null);
      return t.copyWith(category: category);
    }).toList();

    return UnmodifiableListView(tasksWithCategories);
  }

  List<TaskCategory> _getCategories() {
    if (categoriesDataService == null) {
      return [];
    }
    return categoriesDataService.categories;
  }

  @override
  LoadingState state;

  TasksDataService(
      {@required this.tasksRepo, @required this.categoriesDataService}) {
    _initialize();
  }

  _initialize() async {
    try {
      await _refreshTasks();
    } on Exception catch (e) {
      print(e);
    }
  }

  _refreshTasks() async {
    state = LoadingState.Loading;
    try {
      _tasks = await tasksRepo.getTasks();
      state = LoadingState.Success;
    } catch (e) {
      print(e);
      state = LoadingState.Error;
    }
    notifyListeners();
  }

  add(Task task) {
    tasksRepo.addTask(task);
    _refreshTasks();
  }

  update(Task task) {
    tasksRepo.updateTask(task);
    _refreshTasks();
  }

  delete(String id) {
    tasksRepo.deleteTask(id);
    _refreshTasks();
  }
}
