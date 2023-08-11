import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:noname/prensintation/login/login_page.dart';
import 'package:noname/prensintation/routes/app_routes.dart';


class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
@override
  void initState(){
  super.initState();
  Future.delayed(const Duration(seconds: 2)).then((value) => Navigator.pushNamed(context,  RouteName.loginPage));
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF86A2E),
      body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "FoodCort ",
                style: GoogleFonts.outfit(
                  fontSize: 40,
                  fontWeight: FontWeight.w700,
                ),
              ),
              Text(
                "Ordering food is much easier ",
                style: GoogleFonts.outfit(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          )
      ),
    );
  }
}
