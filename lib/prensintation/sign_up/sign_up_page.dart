import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 24,right: 24),
          child: Column(
            children: [
              SizedBox(height: MediaQuery.of(context).size.height*005,),
              Text('Create Account',style: GoogleFonts.outfit(fontSize: 22,fontWeight: FontWeight.w600,color: const Color(0xff191D31)),),
            ],
          ),
        ),
      ),
    );
  }
}
