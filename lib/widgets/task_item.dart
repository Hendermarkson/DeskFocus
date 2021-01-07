import 'package:flutter/material.dart';

class TaskItem extends StatelessWidget {
  final String title;
  final bool isChecked;
  final Function onChange;
  final Function onDelete;
  TaskItem({this.title, this.isChecked, this.onChange, this.onDelete});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        onTap: () => onChange(),
        onLongPress: onDelete,
        title: Text(
          title,
          style: TextStyle(
            decoration:
                isChecked ? TextDecoration.lineThrough : TextDecoration.none,
          ),
        ),
        trailing: Checkbox(
          value: isChecked,
          onChanged: (value) => onChange(),
        ),
      ),
    );
  }
}
