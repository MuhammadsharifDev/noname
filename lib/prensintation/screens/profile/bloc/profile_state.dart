part of 'profile_bloc.dart';

class ProfileState extends Equatable {
  final List<MyTask> tasks;
  final bool isUpdate;
  final PageStatus pageStatus;

  const ProfileState({
    this.tasks = const [],
    this.isUpdate = false,
    this.pageStatus = PageStatus.initial,
  });

  ProfileState copyWith({
    List<MyTask>? tasks,
    PageStatus? pageStatus,
  }) {
    return ProfileState(
      tasks: tasks ?? this.tasks,
      isUpdate: !isUpdate,
      pageStatus: pageStatus ?? this.pageStatus,
    );
  }

  @override
  List<Object?> get props => [tasks, isUpdate, pageStatus];
}

enum PageStatus { initial, loading, success, error }

extension BoxStatus on PageStatus {
  bool get isInitial => this == PageStatus.initial;

  bool get isLoading => this == PageStatus.loading;

  bool get isSuccess => this == PageStatus.success;

  bool get isError => this == PageStatus.error;
}
