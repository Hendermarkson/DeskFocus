import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:desk_focus/blocs/tasks/task_state.dart';
import 'package:desk_focus/blocs/tasks/tasks_event.dart';
import 'package:desk_focus/data/tasks_repository.dart';
import 'package:flutter/material.dart';

class TasksBloc extends Bloc<TasksEvent, TasksState> {
  final TasksRepository repository;

  TasksBloc({@required this.repository}) : super(TasksLoading());

  @override
  Stream<TasksState> mapEventToState(
    TasksEvent event,
  ) async* {
    if (event is TasksLoaded) {
      yield* _mapTasksLoadedToState();
    } else if (event is TaskAdded) {
      yield* _mapTaskAddedToState(event);
    } else if (event is TaskUpdated) {
      yield* _mapTaskUpdatedToState(event);
    } else if (event is TaskDeleted) {
      yield* _mapTaskDeletedToState(event);
    }
  }

  Stream<TasksState> _mapTasksLoadedToState() async* {
    try {
      final tasks = await this.repository.getTasks();
      yield TasksLoadSuccess(
        tasks,
      );
    } catch (e) {
      print(e);
      yield TasksLoadFailed();
    }
  }

  Stream<TasksState> _mapTaskAddedToState(TaskAdded event) async* {
    if (state is TasksLoadSuccess) {
      await repository.addTask(event.task);
      yield* _mapTasksLoadedToState();
    }
  }

  Stream<TasksState> _mapTaskUpdatedToState(TaskUpdated event) async* {
    if (state is TasksLoadSuccess) {
      await repository.updateTask(event.task);
      yield* _mapTasksLoadedToState();
    }
  }

  Stream<TasksState> _mapTaskDeletedToState(TaskDeleted event) async* {
    if (state is TasksLoadSuccess) {
      await repository.deleteTask(event.task?.id);
      yield* _mapTasksLoadedToState();
    }
  }
}
