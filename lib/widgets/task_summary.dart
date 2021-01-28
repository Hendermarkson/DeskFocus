import 'package:flutter/material.dart';

class TaskSummary extends StatelessWidget {
  final String title;
  final String subtitle;
  final int tasksDone;
  final int tasksTotal;

  const TaskSummary({
    this.title,
    this.subtitle,
    this.tasksDone,
    this.tasksTotal,
  });

  getProgress() {
    return (tasksDone ?? 0) / (tasksTotal ?? 1);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3.0,
      margin: EdgeInsets.all(8.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.only(
                top: 16.0, left: 8.0, right: 8.0, bottom: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    title != null
                        ? Text(
                            title,
                            style: TextStyle(
                              fontSize: 18.0,
                            ),
                          )
                        : Container(),
                    subtitle != null
                        ? Text(
                            subtitle,
                            style: TextStyle(
                              fontSize: 14.0,
                            ),
                          )
                        : Container(),
                  ],
                ),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'FINISHED',
                      style: TextStyle(
                        fontSize: 14.0,
                      ),
                    ),
                    Text(
                      '$tasksDone/$tasksTotal',
                      style: TextStyle(
                        fontSize: 12.0,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          LinearProgressIndicator(
            value: getProgress(),
          )
        ],
      ),
    );
  }
}
