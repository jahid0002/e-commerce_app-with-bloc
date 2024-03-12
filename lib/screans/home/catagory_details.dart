import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online/bloc/home/home_bloc.dart';
import 'package:online/bloc/home/home_event.dart';
import 'package:online/bloc/home/home_state.dart';
import 'package:online/custom_widget/custom_appbar.dart';
import 'package:online/custom_widget/custom_cart.dart';
import 'package:online/model/cart_details_model.dart';
import 'package:online/model/product_model.dart';
import 'package:online/screans/home/cart_details.dart';
import 'package:online/utilsh/color.dart';
import 'package:online/utilsh/const.dart';

class Categorydetails extends StatefulWidget {
  final String category;
  const Categorydetails({super.key, required this.category});

  @override
  State<Categorydetails> createState() => _CategorydetailsState();
}

class _CategorydetailsState extends State<Categorydetails> {
  @override
  void initState() {
    super.initState();

    context.read<HomeBloc>().add( CategoryDetailsHomeEvent( category:  widget.category));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          CustomAppBar.customAppBar(context: context, title: widget.category),
      body: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) { 
            switch(state.categoryDetailsStatus){
              case Status.loading:
                      return Center(
                          child: CircularProgressIndicator(
                        color: AppColor.backgroundColor,
                      ));
                    case Status.fail:
                      return Center(
                          child: Text(
                        'Plasse chake your connection',
                        style: Theme.of(context).textTheme.displayMedium,
                      ));
                      case Status.success: 
          return Padding(
            padding: const EdgeInsets.all(15.0),
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
              itemCount: state.cetagoryDetailsList.length, 
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) {
                  ProductModel item = state.cetagoryDetailsList[index]; 
                 
                     return CustomCart(
                  imagePath: item.image!,
                  productPrice: item.price.toString(),
                  productname: item.title!,
                  favoriteIcon: Icons.favorite_border_outlined,
                  offer: '10',
                  wishListButton: () {}, 
                  onTap: () {
                    CartDetailsModel model = CartDetailsModel( 
                                    id: item.id!,
                                    stock: item.rating!.count!,
                                    imagePath: item.image!,
                                    name: item.title!,
                                    price: item.price.toString(),
                                    rating: item.rating!.rate.toString(),
                                    discriprion: item.description!,
                                    cetagory: item.category!);
                                AppName.push(
                                    context: context,
                                    object: CardDetails(item: model));
                  },
                  );
            
                 

                    
                  
             
              }),
          );}
      
        },
      ),
    );
  }
}
