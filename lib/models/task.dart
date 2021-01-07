import 'dart:convert';

Task taskFromJson(String str) => Task.fromJson(json.decode(str));

String taskToJson(Task data) => json.encode(data.toJson());

class Task {
  Task({
    this.id,
    this.name,
    this.isFinished,
  });

  int id;
  String name;
  bool isFinished;

  factory Task.fromJson(Map<String, dynamic> json) => Task(
        id: json['id'],
        name: json['name'],
        isFinished: json['isFinished'],
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'isFinished': isFinished,
      };
}
