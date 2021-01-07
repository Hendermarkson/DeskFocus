import 'package:desk_focus/models/task.dart';
import 'package:desk_focus/screens/tasks/add_task_screen.dart';
import 'package:desk_focus/widgets/tasks_list.dart';
import 'package:flutter/material.dart';

class TasksScreen extends StatefulWidget {
  @override
  _TasksScreenState createState() => _TasksScreenState();
}

class _TasksScreenState extends State<TasksScreen> {
  List<Task> tasks = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            showModalBottomSheet(
              context: context,
              builder: (context) => SingleChildScrollView(
                child: Container(
                  padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).viewInsets.bottom,
                  ),
                  child: AddTaskScreen(
                    onAdd: (String name) {
                      setState(() {
                        tasks.add(new Task(name: name));
                      });
                    },
                  ),
                ),
              ),
              isScrollControlled: true,
            );
          },
        ),
        appBar: AppBar(),
        body: TaskList(
          tasks: tasks,
          onUpdate: (Task task) {
            setState(() {
              task.isFinished = !task.isFinished;
            });
          },
          onDelete: (Task task) {
            setState(() {
              tasks.remove(task);
            });
          },
        ));
  }
}
