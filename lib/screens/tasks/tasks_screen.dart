import 'package:desk_focus/enums/loading_state.dart';
import 'package:desk_focus/models/entities/task.dart';
import 'package:desk_focus/services/tasks_data_service.dart';
import 'package:desk_focus/screens/tasks/add_task_screen.dart';
import 'package:desk_focus/widgets/drawer/app_drawer.dart';
import 'package:desk_focus/widgets/error_indicator.dart';
import 'package:desk_focus/widgets/loading_indicator.dart';
import 'package:desk_focus/widgets/task_summary.dart';
import 'package:desk_focus/widgets/tasks_list.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TasksScreen extends StatefulWidget {
  @override
  _TasksScreenState createState() => _TasksScreenState();
}

class _TasksScreenState extends State<TasksScreen> {
  int _selectedTabIndex = 0;

  void _changeTabIndex(int index) {
    setState(() {
      _selectedTabIndex = index;
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: Builder(
          builder: (_) => FloatingActionButton(
            child: Icon(Icons.add),
            onPressed: () {
              showModalBottomSheet(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16.0),
                ),
                context: context,
                builder: (_) => SingleChildScrollView(
                  child: Container(
                    padding: EdgeInsets.only(
                      bottom: MediaQuery.of(context).viewInsets.bottom,
                    ),
                    child: AddTaskScreen(
                      onAdd: (task) {
                        Provider.of<TasksDataService>(context, listen: false)
                            .add(task);
                      },
                    ),
                  ),
                ),
                isScrollControlled: true,
              );
            },
          ),
        ),
        appBar: AppBar(
          title: Center(
            child: Text('Tasks'),
          ),
        ),
        drawer: AppDrawer(),
        bottomNavigationBar: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.list),
              label: 'Tasks',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.check_box),
              label: 'Completed',
            ),
          ],
          currentIndex: _selectedTabIndex,
          onTap: _changeTabIndex,
        ),
        body: Consumer<TasksDataService>(
          builder: (context, data, child) {
            if (data.state == LoadingState.Loading) {
              return LoadingIndicator();
            }
            if (data.state == LoadingState.Success) {
              if (data.tasks.isEmpty) {
                return Center(
                  child: Text('No tasks created yet'),
                );
              }
              return Container(
                  padding: EdgeInsets.only(top: 12.0),
                  child: Column(
                    children: [
                      TaskSummary(
                        title: 'Tasks',
                        tasksDone: data.tasks.where((x) => x.isFinished).length,
                        tasksTotal: data.tasks.length,
                      ),
                      TaskList(
                        tasks: data.tasks
                            .where(
                                (x) => x.isFinished == (_selectedTabIndex == 1))
                            .toList(),
                        onUpdate: (Task task) {
                          Provider.of<TasksDataService>(context, listen: false)
                              .update(
                                  task.copyWith(isFinished: !task.isFinished));
                        },
                        onDelete: (Task task) {
                          Provider.of<TasksDataService>(context, listen: false)
                              .delete(task.id);
                        },
                      )
                    ],
                  ));
            }
            return Center(child: ErrorIndicator(text: 'Failed to load tasks'));
          },
        ));
  }
}
