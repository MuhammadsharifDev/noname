

part of 'home_bloc.dart';

@immutable

class HomeState extends Equatable{
  final List<ListItems> items;

  const HomeState({this.items = const [],});

  HomeState copyWith({
    List<ListItems>? items,
})=> HomeState(
    items: items?? this.items
  );

  @override
  List<Object?> get props => [items];
}

class ListItems{
  final String image;
  final String text;
  ListItems({required this.text,required this.image});
}