import 'package:desk_focus/app_theme.dart';
import 'package:desk_focus/data/repositories/tasks_repository.dart';
import 'package:desk_focus/screens/tasks/tasks_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'models/tasks_data.dart';

class App extends StatelessWidget {
  final _repository = TasksRepository();
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => new TasksData(repository: _repository),
      child: MaterialApp(
        title: 'DeskFocus',
        theme: AppTheme(lightModeEnabled: false).themeData,
        home: TasksScreen(),
      ),
    );
  }
}
