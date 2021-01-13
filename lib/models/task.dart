import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:uuid/uuid.dart';

Task taskFromJson(String str) => Task.fromJson(json.decode(str));

String taskToJson(Task data) => json.encode(data.toJson());

class Task extends Equatable {
  final String id;
  final String name;
  final bool isFinished;
  final DateTime finished;

  Task({
    id,
    this.name,
    this.isFinished = false,
    this.finished,
  }) : this.id = id ?? Uuid().v4();

  Task copyWith({bool isFinished, DateTime finished, String id, String name}) {
    return Task(
      id: id ?? this.id,
      name: name ?? this.name,
      isFinished: isFinished ?? this.isFinished,
      finished: finished ?? isFinished ? DateTime.now() : null,
    );
  }

  factory Task.fromJson(Map<String, dynamic> json) => Task(
      id: json['id'],
      name: json['name'],
      isFinished: json['isFinished'] == 1 ? true : false,
      finished: DateTime.tryParse(json['finishedDateTime']));

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'isFinished': isFinished ? 1 : 0,
        'finishedDateTime': finished.toString()
      };

  @override
  List<Object> get props => [id, name, isFinished];
}
