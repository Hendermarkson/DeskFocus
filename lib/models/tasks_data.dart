import 'dart:collection';

import 'package:desk_focus/data/repositories/tasks_repository.dart';
import 'package:desk_focus/models/loading_state.dart';
import 'package:flutter/material.dart';
import 'base_data.dart';
import 'task.dart';

class TasksData extends ChangeNotifier implements BaseData {
  List<Task> _tasks = [];

  @override
  LoadingState state;

  final TasksRepository repository;

  UnmodifiableListView<Task> get tasks => UnmodifiableListView(_tasks);

  int get count => _tasks.length;

  TasksData({@required this.repository}) {
    state = LoadingState.Loading;
    _refreshTasks();
  }

  _refreshTasks() async {
    state = LoadingState.Loading;
    try {
      _tasks = await repository.getTasks();
      state = LoadingState.Success;
    } catch (e) {
      print(e);
      state = LoadingState.Error;
    }
    notifyListeners();
  }

  add(Task task) {
    repository.addTask(task);
    _refreshTasks();
  }

  update(Task task) {
    repository.updateTask(task);
    _refreshTasks();
  }

  delete(String id) {
    repository.deleteTask(id);
    _refreshTasks();
  }
}
