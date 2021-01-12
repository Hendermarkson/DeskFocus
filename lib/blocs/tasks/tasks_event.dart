import 'package:desk_focus/models/task.dart';
import 'package:equatable/equatable.dart';

abstract class TasksEvent extends Equatable {
  TasksEvent();

  @override
  List<Object> get props => [];
}

class LoadTasks extends TasksEvent {}

class TaskAdded extends TasksEvent {
  final Task task;

  TaskAdded(this.task);

  @override
  List<Object> get props => [task];

  @override
  String toString() => 'TaskAdded { task: $task }';
}

class TaskUpdated extends TasksEvent {
  final Task task;

  TaskUpdated(this.task);

  @override
  List<Object> get props => [task];

  @override
  String toString() => 'TaskUpdated { updatedTask: $task }';
}

class TaskDeleted extends TasksEvent {
  final Task task;

  TaskDeleted(this.task);

  @override
  List<Object> get props => [task];

  @override
  String toString() => 'TaskDeleted { task: $task }';
}
