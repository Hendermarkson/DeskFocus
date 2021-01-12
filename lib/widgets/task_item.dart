import 'package:desk_focus/models/task.dart';
import 'package:flutter/material.dart';

class TaskItem extends StatelessWidget {
  final Task task;
  final Function onChange;
  final Function onDelete;
  TaskItem({this.task, this.onChange, this.onDelete});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(8.0),
      child: Dismissible(
        key: Key('task_${task.id}'),
        direction: DismissDirection.endToStart,
        background: Container(
          alignment: Alignment.centerRight,
          padding: EdgeInsets.only(right: 16.0),
          color: Colors.red,
          child: Icon(
            Icons.delete,
            color: Colors.white,
          ),
        ),
        onDismissed: (direction) => onDelete(),
        child: ListTile(
          contentPadding: EdgeInsets.only(
            left: 16.0,
            right: 16.0,
            top: 4.0,
            bottom: 4.0,
          ),
          onTap: () => onChange(),
          onLongPress: onDelete,
          title: Text(
            task.name ?? task.id,
            style: TextStyle(
              decoration: task.isFinished
                  ? TextDecoration.lineThrough
                  : TextDecoration.none,
            ),
          ),
          trailing: Checkbox(
            value: task.isFinished,
            onChanged: (value) => onChange(),
          ),
        ),
      ),
    );
  }
}
