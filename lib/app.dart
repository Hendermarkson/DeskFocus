import 'package:desk_focus/app_theme.dart';
import 'package:desk_focus/data/repositories/task_category_repository.dart';
import 'package:desk_focus/data/repositories/tasks_repository.dart';
import 'package:desk_focus/models/task_categories_data.dart';
import 'package:desk_focus/screens/tasks/tasks_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'models/tasks_data.dart';

class App extends StatelessWidget {
  final _repository = TasksRepository();
  final _catRepository = TaskCategoryRepository();
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => new TasksData(
            tasksRepo: _repository,
            categoryRepo: _catRepository,
          ),
        )
      ],
      child: MaterialApp(
        title: 'DeskFocus',
        theme: AppTheme(lightModeEnabled: false).themeData,
        home: TasksScreen(),
      ),
    );
  }
}
