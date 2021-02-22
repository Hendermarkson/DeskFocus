import 'package:desk_focus/constants.dart';
import 'package:desk_focus/models/entities/task_category.dart';
import 'package:flutter/material.dart';

class AddCategoryScreen extends StatefulWidget {
  final Function onAdd;

  AddCategoryScreen({this.onAdd});

  @override
  _AddCategoryScreenState createState() => _AddCategoryScreenState();
}

class _AddCategoryScreenState extends State<AddCategoryScreen> {
  String name;
  String selectedIcon;
  String selectedcColor;

  @override
  Widget build(BuildContext context) {
    final iconSelectItems = iconList
        .map((key, value) => MapEntry(
              key,
              DropdownMenuItem<String>(child: Icon(value), value: key),
            ))
        .values
        .toList();
    final colorSelectItems = colorList
        .map((Color item) => DropdownMenuItem<String>(
              value: '0x${item.value.toRadixString(16)}',
              child: Icon(
                Icons.circle,
                size: 32,
                color: item,
              ),
            ))
        .toList();
    return Container(
      padding: EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            "New Category",
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
              name = value;
            },
          ),
          SizedBox(
            height: 20,
          ),
          DropdownButtonFormField(
            decoration: InputDecoration(
              labelText: 'Icon',
            ),
            value: selectedIcon,
            items: iconSelectItems,
            onChanged: (value) {
              selectedIcon = value;
            },
          ),
          DropdownButtonFormField(
            decoration: InputDecoration(
              labelText: 'Color',
            ),
            value: selectedcColor,
            items: colorSelectItems,
            onChanged: (value) {
              print(value);
              selectedcColor = value;
            },
          ),
          ElevatedButton(
            onPressed: () {
              if (name == null) {
                return;
              }
              widget.onAdd(TaskCategory(
                name: name ?? '-',
                color: selectedcColor,
                icon: selectedIcon,
              ));

              print(selectedcColor);
              Navigator.pop(context);
            },
            child: Text("ADD"),
          )
        ],
      ),
    );
  }
}
