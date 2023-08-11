part of 'home_bloc.dart';

@immutable
abstract class HomeEvent {}
class ListEvent extends HomeEvent{

   ListEvent();

  @override
  List<Object?> get props =>[];
}