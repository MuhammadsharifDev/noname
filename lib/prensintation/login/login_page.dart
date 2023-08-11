import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:noname/prensintation/const/utils/appicon.dart';
import 'package:noname/prensintation/login/bloc/login_bloc.dart';
import 'package:noname/prensintation/routes/app_pages.dart';
import 'package:noname/prensintation/routes/app_routes.dart';
import 'package:noname/prensintation/screens/main/main_page.dart';
import 'package:noname/prensintation/theme_data/elevated_bottoms/elevated_bottom_item.dart';
import 'package:noname/prensintation/theme_data/text_fields_item/textfield_item.dart';
import 'package:noname/prensintation/theme_data/text_style/text_style.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(
      builder: (context, state) {
        return Scaffold(
            body: Padding(
          padding: const EdgeInsets.only(left: 24, right: 24),
          child: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 40,
                  ),
                  TextStyleItems.items(
                      text: 'Login Accaunt',
                      size: 22,
                      fontWeight: FontWeight.w600),
                  const SizedBox(
                    height: 15,
                  ),
                 TextStyleItems.items(text: 'Please login with registered account', size: 14, fontWeight: FontWeight.w400,color: const Color(0xffA7AEC1)),
                  const SizedBox(
                    height: 35,
                  ),
                  TextStyleItems.items(text: 'Email or Phone Number', size: 16, fontWeight: FontWeight.w700,color:const Color(0xff191D31)),
                  const SizedBox(height: 15,),
                  TextFormField(
                    controller: emailController,
                    decoration: TextItems.item(
                        icons: Icons.email_rounded,
                        text: 'Enter your email or phone number'),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                TextStyleItems.items(text: 'Password', size: 16, fontWeight: FontWeight.w400,color: const Color(0xff191D31)),
                  const SizedBox(
                    height: 10,
                  ),
                 TextFormField(
                   obscureText: state.isVisible,
                   controller: passwordController,
                   validator: (value) {
                     if(value!.isEmpty){
                       return "Please enter an email address";
                     }
                     String pattern = r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$';
                     RegExp regExp = RegExp(pattern);
                     if(!regExp.hasMatch(value)){
                       return 'Please enter a valid email address';
                     }
                   },
                   decoration: InputDecoration(
                     filled: true,
                     fillColor: Colors.grey.withOpacity(0.1),
                     suffixIcon: IconButton(onPressed: (){
                       context.read<LoginBloc>().add(IsVisibleEvent(isVisible: !state.isVisible));
                     }, icon:   Icon(state.isVisible?Icons.visibility_off:Icons.visibility)),
                     border: OutlineInputBorder(
                       // Border// Border color
                         borderRadius: BorderRadius.circular(
                           15.0,
                         ),
                         borderSide: BorderSide.none // Border radius
                     ),
                     label: Text(
                       'Password',
                       style: GoogleFonts.outfit(color: Colors.grey),
                     ),
                     prefixIcon:Icon(Icons.lock,color: Colors.grey.withOpacity(0.5),),
                   ),
                 ),
                  const SizedBox(
                    height: 24,
                  ),
                  Row(
                    children: [
                      const Spacer(),
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          'Forgot Password',
                          style: GoogleFonts.outfit(
                              color: const Color(0xffF86A2E), fontSize: 14),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {
                          Navigator.pushNamed(context, RouteName.mainPage);
                          },
                          style: ElevatedBottomStyleItem.items(size: 56,color: const Color(0xffF86A2E)),
                          child: Text(
                            'Sign in',
                            style: GoogleFonts.outfit(
                                color: Colors.white, fontSize: 16),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 15,),
                  Center(child: TextStyleItems.items(text: 'Or using other method', size: 14, fontWeight: FontWeight.w400,color: const Color(0xffA7AEC1))),
                  const SizedBox(height: 15,),
                  ElevatedButton(
                      style: ElevatedBottomStyleItem.items(size: 56,color: const Color(0xffF3F3F3)),
                      onPressed: (){}, child: SizedBox(
                        child: Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                            SvgPicture.asset(AppIcons.google_icon),
                    TextStyleItems.items(text: 'Sign In with Google', size: 16, fontWeight: FontWeight.w600,color: Colors.black),
                  ],),
                        ),
                      )),
                  const SizedBox(height: 15,),
                  ElevatedButton(
                      style: ElevatedBottomStyleItem.items(size: 56,color: const Color(0xffF3F3F3)),
                      onPressed: (){}, child: SizedBox(
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset(AppIcons.facebook_icon),
                          TextStyleItems.items(text: 'Sign In with Facebook', size: 16, fontWeight: FontWeight.w600,color: Colors.black),
                        ],
                      ),
                    ),
                  )),
                ],
              ),
            ),
          ),
        ),
        );
      },
    );
  }
}

