import 'package:equatable/equatable.dart';
import 'package:online/model/product_final_model.dart';

abstract class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object?> get props => [];
}

class ProductHomeEvent extends HomeEvent {
  const ProductHomeEvent();

  @override
  List<Object?> get props => [];
}

class CategoryHomeEvent extends HomeEvent {
  const CategoryHomeEvent();

  @override
  List<Object?> get props => [];
}

class CategoryDetailsHomeEvent extends HomeEvent {
  final String category;

  const CategoryDetailsHomeEvent({required this.category});

  @override
  List<Object?> get props => [category];
}


class AddRemovedWishList extends HomeEvent{ 
  final ProductFinalModel model;
  const AddRemovedWishList({required this.model});

  @override
  List<Object?> get props => [model];

}