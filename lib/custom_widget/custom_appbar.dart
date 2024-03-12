

import 'package:flutter/material.dart';
import 'package:online/utilsh/color.dart';

class CustomAppBar{


  static customAppBar(
    {
      required BuildContext context,
      Widget? leaading,
    String? title, 
    List<Widget>? actions,
    }
   ){
    return AppBar(
   leading: leaading ?? IconButton(onPressed: (){Navigator.pop(context);}, icon: Icon(Icons.arrow_back, size: 25,color: AppColor.blackColor,)),
   // ignore: unnecessary_null_in_if_null_operators
   title: title !=null? Text(title, style: Theme.of(context).textTheme.displayLarge,): null, 
   actions: actions,
    );
   }


}