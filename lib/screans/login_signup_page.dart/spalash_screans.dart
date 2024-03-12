

import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online/bloc/wish_list/wish_list_bloc.dart';
import 'package:online/bloc/wish_list/wish_list_event.dart';
import 'package:online/screans/login_signup_page.dart/login_page.dart';
import 'package:online/screans/nav_page.dart/nave_page.dart';
import 'package:online/utilsh/color.dart';
import 'package:online/utilsh/const.dart';

class SpalashPage extends StatefulWidget {
  const SpalashPage({super.key});

  @override
  State<SpalashPage> createState() => _SpalashPageState();
}

class _SpalashPageState extends State<SpalashPage> {  

  final user = FirebaseAuth.instance.currentUser; 

  @override
  void initState() {
   
    super.initState();

    Timer(const Duration(seconds: 3), () {  
      if(user == null) {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (_)=> const LoginPage()));
      }else{
         context.read<WishListBloc>().add(SeeWishList());
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (_)=> const NavePage()));
       
      }
      
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold( 
      backgroundColor: AppColor.backgroundColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center, 
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(child: Text(AppName.appName,style: Theme.of(context).textTheme.labelMedium,)), 
          const SizedBox(height: 4,),
          Text('Happy Shoping', style: Theme.of(context).textTheme.labelLarge!.copyWith(
            fontWeight: FontWeight.w300,
            fontSize: 14, color: AppColor.whiteColor.withOpacity(.8)),)
        ],
      ) ,
    );
  }
}