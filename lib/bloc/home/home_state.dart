import 'package:equatable/equatable.dart';
import 'package:online/model/product_final_model.dart';
import 'package:online/model/product_model.dart';
import 'package:online/utilsh/const.dart';

class HomeState extends Equatable {
  final List<ProductModel> wishList; 
  final Status status;

  final List<String> categoryList;
  final Status categoryStatus;

  final List<ProductModel> cetagoryDetailsList;
  final Status categoryDetailsStatus; 

  final List<ProductFinalModel> productFinalList;  
  final Status  wishListStatus;
  

  const HomeState(
      {this.wishList = const <ProductModel>[],
      this.status = Status.loading,
      this.categoryStatus = Status.loading,
      this.categoryList = const <String>[],
      this.cetagoryDetailsList = const <ProductModel>[],
      this.categoryDetailsStatus = Status.loading, 
      this.productFinalList = const <ProductFinalModel>[], 
      this.wishListStatus =Status.loading
      });

  HomeState copyWith(
      {List<ProductModel>? wishList,
      Status? status,
      List<String>? categoryList,
      Status? categoryStatus,
      List<ProductModel>? cetagoryDetailsList,
      Status? categoryDetailsStatus,
      List<ProductFinalModel>? productFinalList, 
      Status?  wishListStatus,
      }) {
    return HomeState(
        wishList: wishList ?? this.wishList,
        status: status ?? this.status,
        categoryList: categoryList ?? this.categoryList,
        categoryStatus: categoryStatus ?? this.categoryStatus,
        cetagoryDetailsList: cetagoryDetailsList ?? this.cetagoryDetailsList,
        categoryDetailsStatus:
            categoryDetailsStatus ?? this.categoryDetailsStatus,
            productFinalList: productFinalList?? this.productFinalList, 
            wishListStatus: wishListStatus?? this.wishListStatus
            );
  }

  @override
  List<Object?> get props => [
        wishList,
        status,
        categoryList,
        categoryStatus,
        cetagoryDetailsList,
        categoryDetailsStatus,
        productFinalList, 
        wishListStatus
      ];
}
