import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:noname/prensintation/login/bloc/login_bloc.dart';
import 'package:noname/prensintation/login/login_page.dart';
import 'package:noname/prensintation/routes/app_pages.dart';
import 'package:noname/prensintation/routes/app_routes.dart';
import 'package:noname/prensintation/screens/home/bloc/home_bloc.dart';
import 'prensintation/screens/catalog/bloc/catalog_bloc.dart';
import 'prensintation/screens/main/bloc/main_bloc.dart';
import 'prensintation/screens/profile/bloc/profile_bloc.dart';
import 'prensintation/splash/splash_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => MainBloc()),
        BlocProvider(create: (_) => CatalogBloc()),
        BlocProvider(create: (_) => ProfileBloc()),
        BlocProvider(create: (_) => LoginBloc()),
        BlocProvider(create: (_) => HomeBloc()..add(ListEvent())),
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        onGenerateRoute: AppRoutes.generateRoute,
        initialRoute: RouteName.mainPage,
      ),
    );
  }
}
