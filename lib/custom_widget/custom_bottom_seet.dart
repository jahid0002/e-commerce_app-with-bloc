


import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:online/custom_widget/custom_buttons.dart';
import 'package:online/custom_widget/custom_textfield.dart';

class CustomBottomSheet{

   
   bottomSheet({required BuildContext context, required String editType, required String editData}){
    final editController = TextEditingController();
     final size = MediaQuery.sizeOf(context); 
     final email = FirebaseAuth.instance.currentUser!.email;
     final store = FirebaseFirestore.instance;
  return showBottomSheet(context: context, builder: (context){
    
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Column(children: [ 
        CustomTextField(controller: editController, hintText: editType), 
        SizedBox(height: size.height*0.03,), 
        CustomButton(buttonName: 'Save', onTap: ()async{
             if(editController.text.isNotEmpty){
              

              await store.collection('app').doc(email).update({
                editType : editData
              }).then((value) {
                Navigator.pop(context);
              });


             }
        })

      ],),
    );
    
    
    });
   }


}