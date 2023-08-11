
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';



part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(const HomeState()) {
    on<ListEvent>(_getItems);
  }
  void _getItems(ListEvent event,Emitter<HomeState> emit){
    emit(state.copyWith(items: listItems));
  }
}
final List<ListItems> listItems=[
  ListItems(text: 'HamBurgers', image:'assets/picture_png/gamburger.jpg'),
  ListItems(text: 'Pizza', image: 'assets/picture_png/pizza.jpg'),
  ListItems(text:' Cookies', image: 'assets/picture_png/sweets1.jpg'),
  ListItems(text: 'Cracknel', image: 'assets/picture_png/sweets _2.jpg'),

];
