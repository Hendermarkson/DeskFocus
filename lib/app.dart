import 'package:desk_focus/blocs/tasks/tasks_bloc.dart';
import 'package:desk_focus/blocs/tasks/tasks_event.dart';
import 'package:desk_focus/data/tasks_repository.dart';
import 'package:desk_focus/screens/tasks/tasks_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DeskFocus',
      theme: ThemeData.light(),
      home: BlocProvider(
        create: (BuildContext context) =>
            TasksBloc(repository: TasksRepository())..add(TasksLoaded()),
        child: TasksScreen(),
      ),
    );
  }
}
