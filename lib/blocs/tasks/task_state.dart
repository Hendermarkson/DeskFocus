import 'package:desk_focus/models/task.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class TasksState extends Equatable {
  TasksState();

  @override
  List<Object> get props => [];
}

class TasksLoading extends TasksState {}

class TasksLoadSuccess extends TasksState {
  final List<Task> tasks;

  TasksLoadSuccess([this.tasks = const []]);

  @override
  List<Object> get props => [tasks];
}

class TasksLoadFailed extends TasksState {}
