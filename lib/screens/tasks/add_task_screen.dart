import 'package:desk_focus/models/entities/task.dart';
import 'package:desk_focus/services/categories_data_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddTaskScreen extends StatefulWidget {
  final Function onAdd;

  AddTaskScreen({this.onAdd});

  @override
  _AddTaskScreenState createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  String taskName;
  int taskCategoryId;

  @override
  Widget build(BuildContext context) {
    final categories =
        Provider.of<CategoriesDataService>(context, listen: false).categories;
    final categorySelectItems = categories
        .map((e) => DropdownMenuItem(value: e.id, child: Text(e.name)))
        .toList();
    return Container(
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
            decoration: InputDecoration(
              labelText: 'Name',
            ),
            autofocus: true,
            textAlign: TextAlign.center,
            onChanged: (value) {
              taskName = value;
            },
          ),
          SizedBox(
            height: 20,
          ),
          DropdownButtonFormField(
            decoration: InputDecoration(
              labelText: 'Category',
            ),
            value: taskCategoryId ?? categorySelectItems.first.value,
            items: categorySelectItems,
            onChanged: (value) {
              taskCategoryId = value;
            },
          ),
          ElevatedButton(
            onPressed: () {
              widget.onAdd(Task(
                categoryId: taskCategoryId,
                name: taskName ?? '-',
              ));
              Navigator.pop(context);
            },
            child: Text("ADD"),
          )
        ],
      ),
    );
  }
}
