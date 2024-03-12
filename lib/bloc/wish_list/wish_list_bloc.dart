

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online/bloc/wish_list/wish_list_event.dart';
import 'package:online/bloc/wish_list/wish_list_state.dart';
import 'package:online/model/product_model.dart';
import 'package:online/service/home_service/product_service.dart';
import 'package:online/utilsh/const.dart';

class WishListBloc extends Bloc<WishListEvent, WishListState>{
    final ProductService service;
    List<ProductModel> apiList = []; 
    List<ProductModel> wishList = []; 
    List<num> tempList = []; 
     final email = FirebaseAuth.instance.currentUser!.email; 
     final store = FirebaseFirestore.instance;

    WishListBloc(this.service):super(const WishListState()){
      on<SeeWishList>(_seeWishList); 
      on<AddToWishListEvent>(_addToWishListEvent); 
      on<RemoveToWishListEvent>(_removeToWishListEvent);
    }

    void _seeWishList(SeeWishList event, Emitter<WishListState> emit)async{

             
        
             apiList = await service.getData();

             final data = await store.collection('app').doc(email).collection('wishlist').get(); 
                
             // ignore: unnecessary_null_comparison
             if(data.docs != null ){
               for(int i=0; i<data.docs.length; i++){ 
                if(tempList.length < data.docs.length){
                     tempList.add(data.docs[i]['id']);
                }
                
               } 

              if(tempList.length > wishList.length){
                 for(int i=0; i< tempList.length; i++){
                  for(int j =0; j<apiList.length; j++){
                    if(apiList[j].id == tempList[i]){  
                      if (wishList.length >= tempList.length){
                        return;
                      }else{wishList.add(apiList[j]);
                        emit(state.copyWith(wishList: List.from(wishList ),status: Status.success ));
                      }
                      
                    }
                  }
                } 
              }
               
                print(tempList);
              
              


             }     

      
            
          


        
       
    }
    
    void _addToWishListEvent(AddToWishListEvent event, Emitter<WishListState> emit)async{

           bool? isAdd ;
      if(tempList.isEmpty){
         await store.collection('app').doc(email).collection('wishlist').doc(event.model.id.toString()).set({
            'id' : event.model.id,
          }).then((value) {
            wishList.add(event.model);
              emit(state.copyWith(wishList: List.from(wishList ),status: Status.success));
          });
          
      }else{
  
          if(wishList.contains(event.model)){
                isAdd = true; 
                
          }else{
            isAdd = false;
          }
        }
       if(isAdd!){
        return;
       }else{
           await store.collection('app').doc(email).collection('wishlist').doc(event.model.id.toString()).set({
            'id' : event.model.id,
          }).then((value) {
            wishList.add(event.model);
              emit(state.copyWith(wishList: List.from(wishList ),));
          });
       }

          
        
      
         
    }


    void _removeToWishListEvent(RemoveToWishListEvent event , Emitter<WishListState> emit)async{
           
      await store.collection('app').doc(email).collection('wishlist').doc(event.model.id.toString()).delete().then((value) {
        wishList.remove(event.model);
        emit(state.copyWith(wishList: List.from(wishList)));
      });

    }





}