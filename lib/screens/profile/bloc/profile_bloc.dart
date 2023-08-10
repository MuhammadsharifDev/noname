import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:noname/screens/profile/model.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  ProfileBloc() : super(ProfileState()) {
    on<LoadTaskEvent>(_loadTasks);
    on<CheckTaskEvent>(_checkTask);
    on<DeleteTaskEvent>(_deleteTask);

  }


  void _loadTasks(LoadTaskEvent event, Emitter<ProfileState> emit) async {
    emit(state.copyWith(
      pageStatus: PageStatus.loading,
    ));
    var tasks = _getTasks(event.count);
    await Future.delayed(const Duration(milliseconds: 300));
    emit(state.copyWith(
      pageStatus: PageStatus.success,
      tasks: tasks,
    ));
  }

  void _checkTask(CheckTaskEvent event, Emitter<ProfileState> emit) {
    MyTask editingTask = state.tasks[event.index];
    editingTask = editingTask.copyWith(isDone: !editingTask.isDone);

    var editingTaskList = state.tasks;

    editingTaskList.removeAt(event.index);
    editingTaskList.insert(event.index, editingTask);

    emit(state.copyWith(
      tasks: editingTaskList,
    ));
  }


  void _deleteTask(DeleteTaskEvent event, Emitter<ProfileState> emit) async {
    emit(state.copyWith(
      pageStatus: PageStatus.loading,
    ));
    var editingTaskList = state.tasks;

    editingTaskList = editingTaskList..removeAt(event.index);
    await Future.delayed(const Duration(milliseconds: 300));

    emit(state.copyWith(
      tasks: editingTaskList,
      pageStatus: PageStatus.success,
    ));
  }


  List<MyTask> _getTasks(int count) {
    return List.generate(
      count,
          (index) => MyTask(
        description: 'Task $index',
        isDone: false,
      ),
    );
  }
}

