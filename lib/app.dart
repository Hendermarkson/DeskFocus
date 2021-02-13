import 'package:desk_focus/app_theme.dart';
import 'package:desk_focus/data/repositories/app_settings_repository.dart';
import 'package:desk_focus/data/repositories/task_category_repository.dart';
import 'package:desk_focus/data/repositories/tasks_repository.dart';
import 'package:desk_focus/services/categories_data_service.dart';
import 'package:desk_focus/services/settings_data_service.dart';
import 'package:desk_focus/routes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'services/tasks_data_service.dart';

class App extends StatelessWidget {
  final _repository = TasksRepository();
  final _catRepository = TaskCategoryRepository();
  final _settingsRepository = AppSettingsRepository();
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider<CategoriesDataService>(
            create: (_) => CategoriesDataService(categoryRepo: _catRepository),
          ),
          ChangeNotifierProxyProvider<CategoriesDataService, TasksDataService>(
            create: (_) => TasksDataService(
              tasksRepo: _repository,
              categoriesDataService: null,
            ),
            update: (_, catService, taskService) => TasksDataService(
              tasksRepo: _repository,
              categoriesDataService: catService,
            ),
          ),
          ChangeNotifierProvider<SettingsDataService>(
            create: (_) => SettingsDataService(
              repository: _settingsRepository,
            ),
          )
        ],
        child: Consumer<SettingsDataService>(
          builder: (_, settings, child) {
            return MaterialApp(
              title: 'Desk Focus',
              theme: AppTheme(darkMode: settings.darkModeEnabled).themeData,
              initialRoute: 'home',
              routes: Routes.config,
            );
          },
        ));
  }
}
