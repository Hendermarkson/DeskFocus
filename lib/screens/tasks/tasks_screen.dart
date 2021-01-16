import 'package:desk_focus/models/loading_state.dart';
import 'package:desk_focus/models/loading_state.dart';
import 'package:desk_focus/models/models.dart';
import 'package:desk_focus/models/task.dart';
import 'package:desk_focus/screens/tasks/add_task_screen.dart';
import 'package:desk_focus/widgets/error_indicator.dart';
import 'package:desk_focus/widgets/loading_indicator.dart';
import 'package:desk_focus/widgets/tasks_list.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
                          Provider.of<TasksData>(context, listen: false)
                              .add(new Task(name: name));
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
        body: Consumer<TasksData>(
          builder: (context, data, child) {
            if (data.state == LoadingState.Loading) {
              return LoadingIndicator();
            }
            if (data.state == LoadingState.Success) {
              if (data.tasks.isEmpty) {
                return Center(
                  child: Text('No tasks created yet'),
                );
              }
              return Container(
                padding: EdgeInsets.only(top: 12.0),
                child: TaskList(
                  tasks: data.tasks,
                  onUpdate: (Task task) {
                    Provider.of<TasksData>(context, listen: false)
                        .update(task.copyWith(isFinished: !task.isFinished));
                  },
                  onDelete: (Task task) {
                    Provider.of<TasksData>(context, listen: false)
                        .delete(task.id);
                  },
                ),
              );
            }
            return ErrorIndicator(text: 'Failed to load tasks');
          },
        ));
  }
}
