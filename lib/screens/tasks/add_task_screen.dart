import 'package:flutter/material.dart';

class AddTaskScreen extends StatelessWidget {
  final Function onAdd;

  AddTaskScreen({this.onAdd});

  @override
  Widget build(BuildContext context) {
    String taskTitle;
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(24.0),
          topRight: Radius.circular(24.0),
        ),
      ),
      padding: EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            "New Task",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 24.0,
              fontWeight: FontWeight.w500,
            ),
          ),
          TextField(
            autofocus: true,
            textAlign: TextAlign.center,
            onChanged: (value) {
              taskTitle = value;
            },
          ),
          ElevatedButton(
            onPressed: () {
              onAdd(taskTitle);
              Navigator.pop(context);
            },
            child: Text("ADD"),
          )
        ],
      ),
    );
  }
}
