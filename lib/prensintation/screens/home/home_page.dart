import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:noname/prensintation/const/utils/appicon.dart';
import 'package:noname/prensintation/const/utils/appimages.dart';
import 'package:noname/prensintation/screens/home/bloc/home_bloc.dart';
import 'package:noname/prensintation/theme_data/text_fields_item/textfield_item.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  TextEditingController searchController = TextEditingController();

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
                      child: SvgPicture.asset(AppIcons.action_app_icon),
                    ),
                  ),
                ],
                flexibleSpace: FlexibleSpaceBar(
                  background: Stack(children: [
                    Image.asset(
                      AppImages.unsplash,
                      fit: BoxFit.cover,
                    ),
                    Positioned(
                      top: 250,
                      left: 45,
                      right: 45,
                      child: SizedBox(
                        height: 60,
                        width: double.infinity,
                        child: TextFormField(
                          decoration: TextItems.item(
                              secondIcon: Icons.sort,
                              icons: Icons.search,
                              text: "Let's find the food you like",
                              color: const Color(
                                0xffFFFFFF,
                              )),
                          controller: searchController,
                        ),
                      ),
                    ),
                  ]),
                ),
              ),
              SliverToBoxAdapter(
                child: Column(
                  children: [
                    const SizedBox(height: 20,),
                    SizedBox(
                      height: 41,
                      child: ListView.separated(
                        padding: const EdgeInsets.only(left: 24),
                          itemCount: state.items.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) => Container(
                          width: 122,
                          decoration:  BoxDecoration(
                            color: const Color(0xffF86A2E),
                            borderRadius:BorderRadius.circular(50),
                            ),
                          child:  Row(
                            children: [
                              Image.asset(state.items[index].image),
                              const SizedBox(width: 3,),
                              Text(state.items[index].text),
                            ],
                          ),
                          ), separatorBuilder: (BuildContext context, int index)=> const SizedBox(width: 10,),
                        ),
                      ),
                  ],
                ),
                ),
            ],
          ),
        );
      },
    );
  }
}
