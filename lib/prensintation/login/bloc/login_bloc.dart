



import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(const LoginState()) {
    on<IsVisibleEvent>(_isLiked);

  }

    void _isLiked(IsVisibleEvent event,Emitter<LoginState>emit){
      emit(state.copyWith(isVisible: event.isVisible));
    }
  }

