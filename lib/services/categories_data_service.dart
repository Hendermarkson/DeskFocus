import 'dart:collection';

import 'package:desk_focus/data/repositories/task_category_repository.dart';
import 'package:desk_focus/enums/loading_state.dart';
import 'package:desk_focus/models/entities/task_category.dart';
import 'package:desk_focus/services/base_data_service.dart';
import 'package:flutter/cupertino.dart';

class CategoriesDataService extends ChangeNotifier implements BaseDataService {
  List<TaskCategory> _categories = [];

  final TaskCategoryRepository categoryRepo;

  CategoriesDataService({this.categoryRepo}) {
    _initialize();
  }

  UnmodifiableListView<TaskCategory> get categories =>
      UnmodifiableListView(_categories);

  @override
  LoadingState state;

  _initialize() async {
    try {
      await _refreshCategories();
    } on Exception catch (e) {
      print(e);
    }
  }

  add(TaskCategory category) {
    categoryRepo.addtaskCategory(category);
    _refreshCategories();
  }

  update(TaskCategory category) {
    categoryRepo.updateTaskCategory(category);
    _refreshCategories();
  }

  delete(int id) {
    categoryRepo.deleteTaskCategory(id);
    _refreshCategories();
  }

  _refreshCategories() async {
    state = LoadingState.Loading;
    try {
      _categories = await categoryRepo.getTaskCategories();
      state = LoadingState.Success;
    } catch (e) {
      print(e);
      state = LoadingState.Error;
    }
    notifyListeners();
  }
}
