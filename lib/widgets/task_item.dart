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
      child: Dismissible(
        key: Key(task.id),
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
          onTap: () => onChange(),
          onLongPress: onDelete,
          title: Text(
            task.name,
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
