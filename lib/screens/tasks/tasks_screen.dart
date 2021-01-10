import 'package:desk_focus/blocs/blocs.dart';
import 'package:desk_focus/models/task.dart';
import 'package:desk_focus/screens/tasks/add_task_screen.dart';
import 'package:desk_focus/widgets/tasks_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TasksScreen extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: Builder(
          builder: (_) => FloatingActionButton(
            child: Icon(Icons.add),
            onPressed: () {
              showModalBottomSheet(
                context: context,
                builder: (_) => SingleChildScrollView(
                  child: Container(
                    padding: EdgeInsets.only(
                      bottom: MediaQuery.of(context).viewInsets.bottom,
                    ),
                    child: AddTaskScreen(
                      onAdd: (String name) {
                        if (name != null && name.isNotEmpty) {
                          BlocProvider.of<TasksBloc>(context, listen: false)
                              .add(TaskAdded(new Task(name: name)));
                        }
                      },
                    ),
                  ),
                ),
                isScrollControlled: true,
              );
            },
          ),
        ),
        appBar: AppBar(),
        body: BlocBuilder<TasksBloc, TasksState>(
          builder: (context, state) {
            if (state is TasksLoading) {
              return Text("Load in progress");
            }
            if (state is TasksLoadSuccess) {
              return TaskList(
                tasks: state.tasks,
                onUpdate: (Task task) {
                  BlocProvider.of<TasksBloc>(context).add(
                      TaskUpdated(task.copyWith(isFinished: !task.isFinished)));
                },
                onDelete: (Task task) {
                  BlocProvider.of<TasksBloc>(context).add(TaskDeleted(task));
                },
              );
            }
            return Text("Failed to load tasks");
          },
        ));
  }
}
