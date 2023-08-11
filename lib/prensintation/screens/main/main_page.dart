import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:noname/prensintation/screens/catalog/catalog_page.dart';
import 'package:noname/prensintation/screens/home/home_page.dart';
import 'package:noname/prensintation/screens/main/bloc/main_bloc.dart';
import 'package:noname/prensintation/screens/profile/profile_pagee.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MainBloc, MainState>(
      builder: (context, state) {
        return Scaffold(
          body: IndexedStack(
            index: state.bottomMenu.index,
            children: const [
            HomePage(),
              CatalogPage(),
              ProfilePage(),
            ],
          ),
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: state.bottomMenu.index,
            onTap: (index) {
              context
                  .read<MainBloc>()
                  .add(SetBottomMenuEvent(menu: BottomMenu.values[index]));
            },
            items: const [
              BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.call_to_action), label: 'Catalog'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.person), label: 'Profile'),
            ],
            unselectedItemColor: Colors.grey,
            selectedItemColor: Colors.deepPurple,
          ),
        );
      },
    );
  }
}
