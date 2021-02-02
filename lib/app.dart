import 'package:desk_focus/app_theme.dart';
import 'package:desk_focus/data/repositories/task_category_repository.dart';
import 'package:desk_focus/data/repositories/tasks_repository.dart';
import 'package:desk_focus/models/settings_data.dart';
import 'package:desk_focus/routes.dart';
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
          ChangeNotifierProvider<TasksData>(
            create: (_) => TasksData(
              tasksRepo: _repository,
              categoryRepo: _catRepository,
            ),
          ),
          ChangeNotifierProvider<SettingsData>(
            create: (_) => SettingsData(),
          )
        ],
        child: Consumer<SettingsData>(
          builder: (_, settings, child) {
            return MaterialApp(
              title: 'Desk Focus',
              theme: AppTheme(darkMode: settings.darkMode).themeData,
              initialRoute: 'home',
              routes: Routes.config,
            );
          },
        ));
  }
}
