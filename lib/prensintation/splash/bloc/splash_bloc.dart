import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'splash_event.dart';

part 'splash_state.dart';

class SplashBloc extends Bloc<SplashEvent, SplashState> {
  SplashBloc() : super(const SplashState()) {
    on<InitDataEvent>(_loadData);
  }

  _loadData(
    InitDataEvent event,
    Emitter<SplashState> emit,
  ) async {

    Future<bool> isSignUp()async {
      SharedPreferences pref = await SharedPreferences.getInstance();
      //isSignUp = pref.getBool('isSignUp') ?? false;
      return pref.getBool('isSignUp') ?? false;
    }
    emit(state.copyWith(
      isSignUp: true,
    ));
  }
}
