

import 'package:flutter/material.dart';
import 'package:online/custom_widget/custom_appbar.dart';
import 'package:online/custom_widget/custom_bottom_seet.dart';
import 'package:online/custom_widget/custom_list_tile.dart';
import 'package:online/utilsh/color.dart';
import 'package:online/utilsh/const.dart';

class MyAccountPage extends StatelessWidget {
   MyAccountPage({super.key, required this.data});
   final Map<String, dynamic> data; 
   final CustomBottomSheet customBottomSheet =CustomBottomSheet();
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Scaffold(
      appBar: CustomAppBar.customAppBar(context: context, title: 'My Account'),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(children: [ 
                 
                       Container(
                        height: size.height * 0.20, 
                        width: size.width * 0.30, 
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30), 
                          border: Border.all(width: 2, color: AppColor.backgroundColor), 
                          image:
                          data['image'] != null?  DecorationImage(image: NetworkImage(data['image']), fit: BoxFit.cover):
                           DecorationImage(image: NetworkImage(AppName.imageUrl), fit: BoxFit.cover),
                        ), 
                  
                       ), 
                       
                         Text(data['email'], style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                        fontSize: 16,
                        color: AppColor.blackColor.withOpacity(.5)),), 
          
                        SizedBox(height: size.height * 0.04,), 
                        CustomListTile(
                          subTitle: data['userName'],
                          leading: Icons.person_outline, onTap: (){
                                customBottomSheet.bottomSheet(context: context, editType: 'userName', editData: data['userName']) ;
                          }, title: 'User name', traling:  Text('Edit', style: Theme.of(context).textTheme.displaySmall,),),
                           CustomListTile(
                          subTitle: data['profetion'],
                          leading: Icons.work_outline, onTap: (){}, title: 'Profesion', traling:  Text('Edit', style: Theme.of(context).textTheme.displaySmall,),),
                           CustomListTile(
                          subTitle: data['blood'],
                          leading: Icons.bloodtype_outlined, onTap: (){}, title: 'Blood Group', traling:  Text('Edit', style: Theme.of(context).textTheme.displaySmall,),),
                           CustomListTile(
                          subTitle: data['address'],
                          leading: Icons.location_city_outlined, onTap: (){}, title: 'Loacation', traling:  Text('Edit', style: Theme.of(context).textTheme.displaySmall,),),
                      
          ],),
        ),
      ),
    );
  }
}