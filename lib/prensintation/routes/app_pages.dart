import 'package:flutter/material.dart';
import 'package:noname/prensintation/login/login_page.dart';
import 'package:noname/prensintation/routes/app_routes.dart';
import 'package:noname/prensintation/screens/main/main_page.dart';
import 'package:noname/prensintation/splash/splash_page.dart';

class AppRoutes {
  static Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
    // final args = settings.arguments as Map<String, dynamic>;
      case RouteName.splash:
        return MaterialPageRoute(builder: (_) => const SplashPage());
      case RouteName.loginPage:
        return MaterialPageRoute(builder: (_) => const LoginPage());
      case RouteName.mainPage:
        return MaterialPageRoute(builder: (_) => const MainPage());
      default:
        return MaterialPageRoute(builder: (_) => const Scaffold());
    }
  }
}
