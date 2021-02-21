import 'package:desk_focus/enums/loading_state.dart';
import 'package:desk_focus/models/entities/task.dart';
import 'package:desk_focus/services/categories_data_service.dart';
import 'package:desk_focus/services/tasks_data_service.dart';
import 'package:desk_focus/utils/category-icon.dart';
import 'package:desk_focus/widgets/animated_progressbar.dart';
import 'package:desk_focus/widgets/drawer/app_drawer.dart';
import 'package:desk_focus/widgets/error_indicator.dart';
import 'package:desk_focus/widgets/loading_indicator.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CategoriesScreen extends StatelessWidget {
  double getProgress(int finishtedTasks, int totalTasks) =>
      finishtedTasks / (totalTasks > 0 ? totalTasks : 1);

  List<Task> getTasksByCategoryId(List<Task> tasks, int categoryId) {
    return tasks.where((element) => element.categoryId == categoryId).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Categories'),
      ),
      drawer: AppDrawer(),
      body: Consumer2<CategoriesDataService, TasksDataService>(
          builder: (_, catService, taskService, child) {
        if (catService.state == LoadingState.Loading ||
            taskService.state == LoadingState.Loading) {
          return LoadingIndicator();
        }
        final tasks =
            taskService.state == LoadingState.Success ? taskService.tasks : [];

        if (catService.state == LoadingState.Success) {
          return Container(
              padding: EdgeInsets.only(top: 12.0),
              child: ListView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemBuilder: (context, i) {
                  final category = catService.categories[i];
                  final categoryTasks =
                      getTasksByCategoryId(tasks, category.id);
                  final finishedTasks = categoryTasks
                      .where((element) => element.isFinished)
                      .toList();

                  final noTasks =
                      categoryTasks == null || categoryTasks.isEmpty;
                  return Card(
                    child: Column(
                      children: [
                        ListTile(
                            leading: CircleAvatar(
                              backgroundColor: Colors.transparent,
                              child: getCategoryIcon(category),
                            ),
                            title: Text(category.name),
                            subtitle: noTasks
                                ? Text('No tasks defined')
                                : Text(
                                    '${finishedTasks.length} / ${categoryTasks.length} tasks'),
                            key: Key(
                              category.id.toString(),
                            )),
                        AnimatedProgressBar(
                          progress: getProgress(
                              finishedTasks.length, categoryTasks.length),
                        )
                      ],
                    ),
                  );
                },
                itemCount: catService.categories.length,
              ));
        }
        return Center(child: ErrorIndicator(text: 'Failed to load categories'));
      }),
    );
  }
}
