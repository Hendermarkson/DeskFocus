import 'package:desk_focus/app_theme.dart';
import 'package:desk_focus/data/repositories/task_category_repository.dart';
import 'package:desk_focus/data/repositories/tasks_repository.dart';
import 'package:desk_focus/services/settings_data_service.dart';
import 'package:desk_focus/routes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'services/tasks_data_service.dart';

class App extends StatelessWidget {
  final _repository = TasksRepository();
  final _catRepository = TaskCategoryRepository();
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider<TasksDataService>(
            create: (_) => TasksDataService(
              tasksRepo: _repository,
              categoryRepo: _catRepository,
            ),
          ),
          ChangeNotifierProvider<SettingsDataService>(
            create: (_) => SettingsDataService(),
          )
        ],
        child: Consumer<SettingsDataService>(
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
