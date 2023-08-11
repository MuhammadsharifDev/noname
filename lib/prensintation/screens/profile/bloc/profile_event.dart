part of 'profile_bloc.dart';

@immutable
abstract class ProfileEvent {}

class  LoadTaskEvent extends ProfileEvent{
  final int count;
   LoadTaskEvent ({this.count=10});
  @override
  List<Object?> get props => [count];
}

class CheckTaskEvent extends ProfileEvent {
  final int index;

  CheckTaskEvent({required this.index});

  @override
  List<Object?> get props => [index];
}

class DeleteTaskEvent extends ProfileEvent {
  final int index;

  DeleteTaskEvent({required this.index});

  @override
  List<Object?> get props => [index];
}