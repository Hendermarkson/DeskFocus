import 'package:desk_focus/models/task.dart';
import 'package:desk_focus/widgets/task_item.dart';
import 'package:flutter/material.dart';

class TaskList extends StatelessWidget {
  final List<Task> tasks;
  final Function onUpdate;
  final Function onDelete;

  const TaskList({this.tasks, this.onUpdate, this.onDelete});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, i) {
        final task = tasks[i];
        return TaskItem(
          title: task.name,
          isChecked: task.isFinished,
          onChange: () => onUpdate(task),
          onDelete: () => onDelete(task),
        );
      },
      itemCount: tasks.length,
    );
  }
}
