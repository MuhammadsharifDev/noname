part of 'splash_bloc.dart';

class SplashState extends Equatable {
  final bool isSignUp;

  const SplashState({
    this.isSignUp = false,
  });

  SplashState copyWith({
    bool? isSignUp,
  }) {
    return SplashState(
      isSignUp: isSignUp ?? this.isSignUp,
    );
  }

  @override
  List<Object?> get props => [isSignUp];
}
