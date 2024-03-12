import 'package:equatable/equatable.dart';
import 'package:online/model/product_model.dart';
import 'package:online/utilsh/const.dart';

class WishListState extends Equatable{


 final List<ProductModel> wishList ;
 final Status status;

 const WishListState ({this.wishList = const[], this.status = Status.loading});




WishListState copyWith({List<ProductModel>? wishList, Status? status}){
  return WishListState(
    wishList: wishList?? this.wishList,
    status: status??this.status,
  );
}

  @override
  List<Object?> get props => [wishList, status];



}