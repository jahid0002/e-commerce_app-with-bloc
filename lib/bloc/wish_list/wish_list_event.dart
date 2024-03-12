

import 'package:equatable/equatable.dart';
import 'package:online/model/product_model.dart';

abstract class WishListEvent extends Equatable{ 


 const WishListEvent();


  @override

  List<Object?> get props => [];

} 



class SeeWishList extends WishListEvent{



  @override
  List<Object?> get props => [];
}   


class AddToWishListEvent extends WishListEvent{
  final ProductModel model; 
  const AddToWishListEvent({required this.model}); 



  @override
  List<Object?> get props => [model];
}


class RemoveToWishListEvent extends WishListEvent{
  final ProductModel model; 
  const RemoveToWishListEvent({required this.model}); 



  @override
  List<Object?> get props => [model];
}