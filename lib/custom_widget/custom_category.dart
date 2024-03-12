

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:online/utilsh/color.dart';

class CustomCategory extends StatelessWidget {
  const CustomCategory({super.key, required this.imagePath, required this.onTap});
   final String imagePath; 
   final VoidCallback onTap;
  @override
  Widget build(BuildContext context) { 
    final size = MediaQuery.sizeOf(context);
    return Row(
      children: [
        InkWell( 
          onTap: onTap,
          child: Column(
            children: [
              Container(
                     height: size.height * 0.09, 
                     width: size.height * 0.09, 
                     decoration: BoxDecoration(
                      border: Border.all(color: AppColor.blackColor.withOpacity(0.2), width: 1), 
                      borderRadius: BorderRadius.circular(5)
              
                     ), 
                     child: Padding(
                       padding: const EdgeInsets.all(10.0),
                       child: CachedNetworkImage(imageUrl: imagePath, fit: BoxFit.contain,
                       
                       ),
                     ),
              ),
             
            ],
          ),
        ),
        SizedBox(width: size.height * 0.01,)
      ],
    );
  }
}