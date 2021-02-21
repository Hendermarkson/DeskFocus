import 'package:desk_focus/models/entities/task.dart';
import 'package:desk_focus/utils/category-icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

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
      child: Slidable(
        key: Key('task_${task.id}'),
        actionPane: SlidableDrawerActionPane(),
        actionExtentRatio: 0.25,
        actions: [
          IconSlideAction(
            color: task.isFinished ? Colors.blue : Colors.green,
            onTap: toggleState,
            icon: task.isFinished ? Icons.undo : Icons.check,
          )
        ],
        secondaryActions: [
          IconSlideAction(
            color: Colors.red,
            onTap: onDelete,
            icon: Icons.delete,
          )
        ],
        child: ListTile(
            contentPadding: EdgeInsets.only(
              left: 16.0,
              top: 4.0,
              bottom: 4.0,
            ),
            title: Text(task.name ?? task.id, style: TextStyle()),
            leading: getCategoryIcon(task.category)),
      ),
    );
  }
}
