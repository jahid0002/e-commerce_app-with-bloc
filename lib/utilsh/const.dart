

import 'package:flutter/material.dart';

class AppName{
  static String appName = 'Online-Shoping';

  static void push({required BuildContext context, required Widget object}){
     Navigator.push(context, MaterialPageRoute(builder: (context)=> object ));
   } 

   static void pushReplacement({required BuildContext context, required Widget object}){
     Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> object ));
   } 

  static String imageUrl = 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSCl1kz5hyVKdG_h1592_bOA-IpNmB4LoLCjQ&usqp=CAU';


  static List<String> imageUrlList = [
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTghdjBMABA-JsAjb1cGJZP2mLrk8bH-5u4-g&usqp=CAU', 
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSUwGzbQ7ffgf6IF_pzVv87ZMKBOIodhRz1gA&usqp=CAU', 
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQpNnXSFZijEoaI__48V5KTeAnQoZ80mxrAWA&usqp=CAU'
  ];

static String categoryImageUrl = 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRL9bD5c4xOy2DfHq2V9tKxg9wgW3WPMPfzmw&usqp=CAU'; 


     static List<String> categoryImageUrlList =[
      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSdV3g5yZkRGk_EwmbBHAmd_EJ6Sewj31lr1Q&usqp=CAU',
      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSPIfGOyNE9P7DVTwTAWrK2cycEmQDDZA3ODQ&usqp=CAU',
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRjFdrOkiVYAjSoKvf8KP5LY42Gy7LuIgyb-A&usqp=CAU',
      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRL9bD5c4xOy2DfHq2V9tKxg9wgW3WPMPfzmw&usqp=CAU'
     ];






  static String productUrl = 'https://fakestoreapi.com/products'; 
  static String categoryUrl = 'https://fakestoreapi.com/products/categories'; 



}


enum Status{loading, success, fail }