


import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:online/bloc/home/home_event.dart';
import 'package:online/bloc/home/home_state.dart';
import 'package:online/model/product_final_model.dart';
import 'package:online/model/product_model.dart';
import 'package:online/service/home_service/product_service.dart';
import 'package:online/utilsh/const.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState>{

     ProductService service; 
     List<ProductModel> productList =  [];
     List<String> categoryList = []; 
     List<ProductFinalModel>productFinalList = [];
     List<ProductModel> wishList =  [];

     final email = FirebaseAuth.instance.currentUser!.email; 
     final store = FirebaseFirestore.instance;



      HomeBloc(this.service):super(const HomeState()){

          on<ProductHomeEvent>(_productHomeEvent); 
          on<CategoryHomeEvent>(_categoryHomeEvent);
          on<CategoryDetailsHomeEvent>(_categoryDetailsHomeEvent);
          on<AddRemovedWishList>(_addRemovedWishList);
      }
      
      void _productHomeEvent(ProductHomeEvent event, Emitter<HomeState>emit)async{
         productList = await service.getData(); 
         final data = await store.collection('app').doc(email).collection('wishlist').get();
         if(productList.isEmpty){
          emit(state.copyWith(status: Status.fail));
         } else{
           // ignore: unnecessary_null_comparison
           if(data.docs.isEmpty){
            print('hello');
                for(int i=0; i<productList.length; i++){
                  final ProductFinalModel model =ProductFinalModel(isFavorite: false, model: productList[i]);
                  productFinalList.add(model);
                  
                }
                emit(state.copyWith(
                    productFinalList: List.from(productFinalList), 
                    status: Status.success, 
                    wishListStatus: Status.loading,
                  ));
           }else{ 
            for(int i=0; i<data.docs.length; i++){
              for(int j=0; j<productList.length; j++){
                if(productList[j].id == data.docs[i]['id']){
                  final ProductFinalModel model =ProductFinalModel(isFavorite: true, model: productList[i]);
                  productFinalList.add(model);
                  if(data.docs.length > wishList.length){
                    wishList.add(productList[j]);
                  }
                  
                  emit(state.copyWith(
                    productFinalList: List.from(productFinalList), 
                    status: Status.success ,
                    wishList: List.from(wishList), 
                    wishListStatus: Status.success
                  ));
                }else{
                  final ProductFinalModel model =ProductFinalModel(isFavorite: false, model: productList[j]);
                  productFinalList.add(model);
                  emit(state.copyWith(
                    productFinalList: List.from(productFinalList), 
                    status: Status.success
                  ));
                }
              }
            }



           }
            
          
         }
      } 
 void _categoryHomeEvent(CategoryHomeEvent event, Emitter<HomeState>emit)async{
         categoryList = await service.getCategory(); 
         if(categoryList.isEmpty){
          emit(state.copyWith(categoryStatus: Status.fail));
         } else{
           emit(state.copyWith(
            categoryList: List.from(categoryList),
            categoryStatus: Status.success
            
            ));
         }
      } 

       void _categoryDetailsHomeEvent(CategoryDetailsHomeEvent event, Emitter<HomeState>emit)async{ 
       
       List<ProductModel> list = [];

               list.clear();
             if(productList.isEmpty){
              emit(state.copyWith(categoryDetailsStatus: Status.fail));
             }else{
              for(int i=0; i<productList.length; i++){
                if(productList[i].category! == event.category){
                  list.add(productList[i]);
                }
              }
              emit(state.copyWith(
                categoryDetailsStatus: Status.success,
                cetagoryDetailsList: List.from(list)));
             }

       }


   
void _addRemovedWishList(AddRemovedWishList event, Emitter<HomeState> emit)async{


        if(!event.model.isFavorite){
             await store.collection('app').doc(email).collection('wishlist').doc(event.model.model.id.toString()).set({
            'id' : event.model.model.id,
          }).then((value) {
          
           
              int  index = productFinalList.indexWhere((element)=>element.model.id! == event.model.model.id!);
            
                  productFinalList[index].isFavorite = true; 
              

              wishList.add(event.model.model);


               emit(state.copyWith(
                productFinalList: List.from(productFinalList), 
                wishList: List.from(wishList),
               ));


          });


        }else{

           await store.collection('app').doc(email).collection('wishlist').doc(event.model.model.id.toString()).delete().then((value) {

          

              int  index = productFinalList.indexWhere((element)=>element.model.id! == event.model.model.id!);
            
                  productFinalList[index].isFavorite = false; 
              int wishListIndex = wishList.indexWhere((element) => element.id == event.model.model.id); 

              wishList.removeAt(wishListIndex); 


               emit(state.copyWith(
                productFinalList: List.from(productFinalList), 
                wishList: List.from(wishList),
               ));


           });
         


        }


}

}