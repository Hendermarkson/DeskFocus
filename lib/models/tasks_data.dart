import 'dart:collection';

import 'package:desk_focus/data/repositories/task_category_repository.dart';
import 'package:desk_focus/data/repositories/tasks_repository.dart';
import 'package:desk_focus/enums/loading_state.dart';
import 'package:flutter/material.dart';
import 'base_data.dart';
import 'entities/task.dart';
import 'entities/task_category.dart';

class TasksData extends ChangeNotifier implements BaseData {
  List<Task> _tasks = [];
  List<TaskCategory> _categories = [];

  final TasksRepository tasksRepo;
  final TaskCategoryRepository categoryRepo;

  UnmodifiableListView<TaskCategory> get categories =>
      UnmodifiableListView(_categories);

  UnmodifiableListView<Task> get tasks {
    var tasksWithCategories = _tasks;
    if (_categories.isNotEmpty) {
      tasksWithCategories = _tasks.map((t) {
        var category = _categories.firstWhere((x) => x.id == t.categoryId,
            orElse: () => null);
        return t.copyWith(category: category);
      }).toList();
    }

    return UnmodifiableListView(tasksWithCategories);
  }

  @override
  LoadingState state;

  TasksData({@required this.tasksRepo, @required this.categoryRepo}) {
    _initData();
  }

  _initData() async {
    state = LoadingState.Loading;
    try {
      _tasks = await tasksRepo.getTasks();
      _categories = await categoryRepo.getTaskCategories();
      state = LoadingState.Success;
    } catch (e) {
      print(e);
      state = LoadingState.Error;
    }
    notifyListeners();
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
