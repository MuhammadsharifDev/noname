part of 'login_bloc.dart';

abstract class LoginEvent {}

class IsVisibleEvent extends LoginEvent {
  final bool isVisible;

  IsVisibleEvent({required this.isVisible});

  @override
  List<Object?> get props => [isVisible];
}
