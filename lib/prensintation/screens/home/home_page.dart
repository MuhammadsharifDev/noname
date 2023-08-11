import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:noname/prensintation/const/utils/appicon.dart';
import 'package:noname/prensintation/const/utils/appimages.dart';
import 'package:noname/prensintation/screens/home/bloc/home_bloc.dart';
import 'package:noname/prensintation/theme_data/text_fields_item/textfield_item.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        return Scaffold(
          body: CustomScrollView(
            slivers: [
              SliverAppBar(
                expandedHeight: 337,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(50),
                    bottomRight: Radius.circular(50),
                  ),
                ),
                backgroundColor: Colors.white,
                elevation: 0,
                pinned: true,
                leading: Padding(
                  padding: const EdgeInsets.only(left: 15),
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    child: SvgPicture.asset(AppIcons.appbar_icon),
                  ),
                ),
                actions: [
                  Padding(
                    padding: const EdgeInsets.only(right: 15),
                    child: CircleAvatar(
                      backgroundColor: Colors.white,
                      child:SvgPicture.asset(AppIcons.action_app_icon),
                    ),
                  ),
                ],
                flexibleSpace: FlexibleSpaceBar(
                  background: Stack(
                    children: [
                      Positioned(
                          child: TextFormField(
                            decoration: TextItems.item(icons: Icons.search, text:'Lets find the food  you like'),
                          ),
                      ),
                      Image.asset(
                      AppImages.unsplash,
                      fit: BoxFit.cover,
                    ),
                    ]
                  ),
                ),
              ),
              
            ],
          ),
        );
      },
    );
  }
}
