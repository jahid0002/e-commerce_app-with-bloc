
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online/bloc/home/home_bloc.dart';
import 'package:online/bloc/home/home_event.dart';
import 'package:online/bloc/home/home_state.dart';
import 'package:online/custom_widget/custom_cart.dart';
import 'package:online/model/cart_details_model.dart';
import 'package:online/model/product_final_model.dart';
import 'package:online/screans/home/cart_details.dart';
import 'package:online/utilsh/const.dart';

class WishListPage extends StatefulWidget {
  const WishListPage({super.key});

  @override
  State<WishListPage> createState() => _WishListPageState();
}

class _WishListPageState extends State<WishListPage> {

    @override
  void initState() {
    super.initState();


    context.read<HomeBloc>().add(const ProductHomeEvent());
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {

            switch(state.wishListStatus){
              case Status.loading : return const Center(child: Text('No favorite item')); 
              case Status.fail : return const Center(child: Text('No favorite item')); 
              case Status.success : 

          return GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2),
              itemCount: state.wishList.length,
              itemBuilder: (context, index) {
                final data = state.wishList[index]; 

                     return CustomCart(
                    imagePath: data.image!,
                    productPrice: data.price.toString(),
                    productname: data.title!,
                    favoriteIcon: Icons.favorite,
                    offer: '10',
                    wishListButton: (){
                      ProductFinalModel model = ProductFinalModel(isFavorite: true, model: data);
                      context.read<HomeBloc>().add(AddRemovedWishList(model: model));
                    },
                    onTap: (){
                       CartDetailsModel model = CartDetailsModel(
                                        id: data.id!,
                                        stock: data.rating!.count!,
                                        imagePath: data.image!,
                                        name: data.title!,
                                        price: data.price.toString(),
                                        rating: data.rating!.rate.toString(),
                                        discriprion: data.description!,
                                        cetagory: data.category!);
                                    AppName.push(
                                        context: context,
                                        object: CardDetails(item: model));
                    });
                
               
              });
              
            }

        },
      ),
    );
  }
}
