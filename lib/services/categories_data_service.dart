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
    _initData();
  }

  UnmodifiableListView<TaskCategory> get categories =>
      UnmodifiableListView(_categories);

  @override
  LoadingState state;

  _initData() async {
    await _refreshCategories();
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
