


import 'package:flutter/material.dart';
import 'package:online/utilsh/color.dart';

class CustomTextTheme  {
 
      
      static  TextTheme textTheme = TextTheme(
        titleLarge: TextStyle(fontSize: 26, fontWeight: FontWeight.w900, color: AppColor.backgroundColor),
        titleMedium:  TextStyle(fontSize: 24, fontWeight: FontWeight.w900, color: AppColor.backgroundColor), 
        titleSmall:  TextStyle(fontSize: 22, fontWeight: FontWeight.w900, color: AppColor.backgroundColor), 

        bodyLarge:  TextStyle(fontSize: 26, fontWeight: FontWeight.w900, color: AppColor.blackColor), 
        bodyMedium:  TextStyle(fontSize: 24, fontWeight: FontWeight.w900, color: AppColor.blackColor),
        bodySmall:  TextStyle(fontSize: 22, fontWeight: FontWeight.w900, color: AppColor.blackColor), 

        displayLarge:  TextStyle(fontSize: 20, fontWeight: FontWeight.w700, color: AppColor.backgroundColor),
        displayMedium:  TextStyle(fontSize: 18, fontWeight: FontWeight.w700, color: AppColor.backgroundColor),
        displaySmall:  TextStyle(fontSize: 16, fontWeight: FontWeight.w700, color: AppColor.backgroundColor), 

        headlineLarge: TextStyle(fontSize: 20, fontWeight: FontWeight.w700, color: AppColor.blackColor),  
        headlineMedium: TextStyle(fontSize: 18, fontWeight: FontWeight.w700, color: AppColor.blackColor),  
        headlineSmall: TextStyle(fontSize: 16, fontWeight: FontWeight.w700, color: AppColor.blackColor), 
        
        labelLarge: TextStyle(fontSize: 20, fontWeight: FontWeight.w900, color: AppColor.whiteColor),  
        
        labelMedium: TextStyle(fontSize: 26, fontWeight: FontWeight.w900, color: AppColor.whiteColor),
        labelSmall: TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color: AppColor.blackColor),  

      ); 


   static AppBarTheme appBarTheme = AppBarTheme(
         
         centerTitle: true, 
         backgroundColor: AppColor.whiteColor, 
         elevation: 0, 
         scrolledUnderElevation: 0, 

   );

   
  
  }
