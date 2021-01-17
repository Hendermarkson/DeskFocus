import 'package:desk_focus/models/task.dart';
import 'package:flutter/material.dart';

class TaskItem extends StatelessWidget {
  final Task task;
  final Function toggleState;
  final Function onDelete;
  TaskItem({this.task, this.toggleState, this.onDelete});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3.0,
      margin: EdgeInsets.all(8.0),
      child: Dismissible(
        key: Key('task_${task.id}'),
        background: Container(
          alignment: Alignment.centerLeft,
          padding: EdgeInsets.only(left: 16.0),
          color: task.isFinished ? Colors.blue : Colors.green,
          child: Icon(
            task.isFinished ? Icons.undo : Icons.check,
            color: Colors.white,
          ),
        ),
        secondaryBackground: Container(
          alignment: Alignment.centerRight,
          padding: EdgeInsets.only(right: 16.0),
          color: Colors.red,
          child: Icon(
            Icons.delete,
            color: Colors.white,
          ),
        ),
        onDismissed: (direction) {
          if (direction == DismissDirection.startToEnd) {
            toggleState();
          } else {
            onDelete();
          }
        },
        child: ListTile(
          contentPadding: EdgeInsets.only(
            top: 4.0,
            bottom: 4.0,
          ),
          title: Text(task.name ?? task.id, style: TextStyle()),
          leading: Checkbox(
            value: task.isFinished,
            onChanged: (value) => toggleState(),
          ),
        ),
      ),
    );
  }
}
