

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:online/custom_widget/custom_appbar.dart';
import 'package:online/custom_widget/custom_list_tile.dart';
import 'package:online/screans/login_signup_page.dart/login_page.dart';
import 'package:online/screans/profile/my_account_page.dart';
import 'package:online/utilsh/color.dart';
import 'package:online/utilsh/const.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
      
      final size = MediaQuery.sizeOf(context);
      final email = FirebaseAuth.instance.currentUser!.email; 
      final store = FirebaseFirestore.instance.collection('app').doc(email);

    return Scaffold( 

      appBar: CustomAppBar.customAppBar(
        leaading: Container(),
        context: context, title: 'Profile'),


      body: Padding(
        padding: const EdgeInsets.only(right: 25.0, left: 15 ),
        child: SingleChildScrollView(
          child: StreamBuilder(
            stream: store.snapshots(),
            builder: (context, snapshot) {
              if(snapshot.hasError){
                return Center(child: Text('Plasse chake your data', style: Theme.of(context).textTheme.displayLarge,));
              } else if(snapshot.connectionState == ConnectionState.waiting){
                return Center(child: CircularProgressIndicator(color: AppColor.backgroundColor,));
              }else if(snapshot.hasData){ 
                final data = snapshot.data!.data();
                return Column(children: [ 
                         data!['image'] == null?
                  
                    CircleAvatar(
                      backgroundColor: AppColor.backgroundColor.withOpacity(.2),
                      radius: 50, 
                      backgroundImage: NetworkImage(AppName.imageUrl), 
              
                      
                    ): 
                    CircleAvatar(
                      backgroundColor: AppColor.backgroundColor.withOpacity(.2),
                      radius: 50, 
                      backgroundImage: NetworkImage(data['image']), 
              
                      
                    ),
                     Text(data['userName'], style: Theme.of(context).textTheme.headlineMedium),
                    Text(data['email'], style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                      fontSize: 16,
                      color: AppColor.blackColor.withOpacity(.5)),), 
              
                      SizedBox(height: size.height * 0.04,),
                    CustomListTile2(leading: Icons.account_circle_outlined, title: 'My Account', onTap: (){
                      AppName.push(context: context, object:  MyAccountPage(data: data,));
                    }), 
              
                     CustomListTile2(leading: Icons.history_outlined, title: 'Histroy', onTap: (){}), 
                      CustomListTile2(leading: Icons.settings_outlined, title: 'Settings', onTap: (){}), 
                       CustomListTile2(leading: Icons.inventory_outlined, title: 'Invite Friend', onTap: (){}), 
                        CustomListTile2(leading: Icons.logout_rounded, title: 'Sign Out', onTap: (){
                          FirebaseAuth.instance.signOut().then((value){
                            AppName.pushReplacement(context: context, object: const LoginPage());
                          });
                        })
              ],);
              }else{
                return Center(child: CircularProgressIndicator(color: AppColor.backgroundColor,));
              }
              
            }
          ),
        ),
      ),
    );
  }
}