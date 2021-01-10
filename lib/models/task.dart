import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:uuid/uuid.dart';

Task taskFromJson(String str) => Task.fromJson(json.decode(str));

String taskToJson(Task data) => json.encode(data.toJson());

class Task extends Equatable {
  final int id;
  final String name;
  final bool isFinished;

  Task({
    id,
    this.name,
    this.isFinished,
  }) : this.id = id ?? Uuid().v4();

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

  @override
  List<Object> get props => [id, name, isFinished];
}
