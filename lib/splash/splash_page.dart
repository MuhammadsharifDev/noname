import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:noname/screens/const/utils/appimages.dart';
import 'package:noname/screens/main/main_page.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> with TickerProviderStateMixin{
  late AnimationController _controller;
  late TextStyleTween _styleTween;
  late CurvedAnimation _curvedAnimation;
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )..repeat(reverse: true);
    _styleTween = TextStyleTween(
      begin: const TextStyle(
          fontSize: 30, color: Colors.blue, fontWeight: FontWeight.w600),
      end: const TextStyle(
          fontSize: 30, color: Colors.black, fontWeight: FontWeight.w100),
    );
    _curvedAnimation = CurvedAnimation(
      parent: _controller,
      curve: Curves.bounceIn,
    );
    Future.delayed(
        const Duration(seconds: 5)).then((value) =>
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => MainPage(),),),);
  }


  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: const Color(0xffF86A2E),
        body:DefaultTextStyleTransition(
          style: _styleTween.animate(_curvedAnimation),
          child: Center(
            child: Text('FoodCort',style:GoogleFonts.outfit(color: Colors.white,fontWeight: FontWeight.w700,fontSize: 40),),
                //Text('Ordering food is much easier ',style:GoogleFonts.outfit(color: Colors.white,fontWeight: FontWeight.w400,fontSize: 16),)
          ),
        ),
    );

  }
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
