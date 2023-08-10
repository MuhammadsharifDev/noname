import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:noname/screens/catalog/bloc/catalog_bloc.dart';
import 'package:noname/screens/home/bloc/home_bloc.dart';
import 'package:noname/screens/main/main_page.dart';
import 'package:noname/screens/profile/bloc/profile_bloc.dart';
import 'package:noname/splash/splash_page.dart';

import 'screens/main/bloc/main_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers:[
        BlocProvider(create: (_)=>MainBloc()),
        BlocProvider(create: (_)=>HomeBloc()),
        BlocProvider(create: (_)=>CatalogBloc()),
        BlocProvider(create: (_)=> ProfileBloc()),
        BlocProvider(create: (_)=> MainBloc()),

    ],
      child:const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SplashPage(),
      ),
      );

  }
}

