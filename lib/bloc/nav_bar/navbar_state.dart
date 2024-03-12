import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:online/screans/home/home_page.dart';
import 'package:online/screans/profile/profile_page.dart';
import 'package:online/screans/wish_list/wish_list_page.dart';

class NavBarState extends Equatable {
  final List<Widget> page = [
    const HomePage(),
    const WishListPage(),
    const Center(child: Text('cart')),
    const ProfilePage(),
  ]; 

  final int index; 
  NavBarState({this.index = 0}); 

  NavBarState copyWith({int? index}){
    return NavBarState(
      index: index?? this.index
    );
  }


  @override
  List<Object?> get props => [page, index];
}
