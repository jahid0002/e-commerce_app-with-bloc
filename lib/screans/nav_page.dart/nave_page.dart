import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online/bloc/nav_bar/navbar_bloc.dart';
import 'package:online/bloc/nav_bar/navbar_state.dart';
import 'package:online/bloc/nav_bar/navebar_event.dart';
import 'package:online/utilsh/color.dart';

class NavePage extends StatelessWidget {
  const NavePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BlocBuilder<NavBarBloc, NavBarState>(builder: (context, state) {
      return state.page[state.index];
    }), bottomNavigationBar: BlocBuilder<NavBarBloc, NavBarState>(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.all(10.0),
          child: BottomNavigationBar( 
            backgroundColor: AppColor.whiteColor,
              currentIndex: state.index,
              onTap: (value) {
                context.read<NavBarBloc>().add(CurrentIndexEvent(updateIndex: value, context: context));
              },
              selectedIconTheme: IconThemeData(
                color: AppColor.backgroundColor,
                size: 35,
              ),
              unselectedIconTheme: IconThemeData(
                color: AppColor.gColor,
                size: 30,
              ),
              
            selectedFontSize: 0,
            selectedItemColor: AppColor.backgroundColor,
          
              unselectedFontSize: 0,
              items: const [
                BottomNavigationBarItem(
                    icon: Icon(
                      Icons.home_outlined,
                    ),
                    label: 'Home'),
                BottomNavigationBarItem(
                    icon: Icon(
                      Icons.favorite_outline,
                    ),
                    label: 'Wish List'),
                BottomNavigationBarItem(
                    icon: Icon(
                      Icons.shopping_cart_outlined,
                    ),
                    label: 'Cart'),
                BottomNavigationBarItem(
                    icon: Icon(
                      Icons.account_box_outlined,
                    ),
                    label: 'Profile'),
              ]),
        );
      },
    ));
  }
}
