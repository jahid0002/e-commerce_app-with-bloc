import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online/bloc/home/home_bloc.dart';
import 'package:online/bloc/home/home_event.dart';
import 'package:online/bloc/home/home_state.dart';
import 'package:online/custom_widget/custom_appbar.dart';
import 'package:online/custom_widget/custom_cart.dart';
import 'package:online/custom_widget/custom_category.dart';
import 'package:online/model/cart_details_model.dart';
import 'package:online/model/product_model.dart';
import 'package:online/screans/home/cart_details.dart';
import 'package:online/screans/home/catagory_details.dart';
import 'package:online/utilsh/color.dart';
import 'package:online/utilsh/const.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final key = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();

    context.read<HomeBloc>().add(const ProductHomeEvent());
    context.read<HomeBloc>().add(const CategoryHomeEvent());
    
  }

  final email = FirebaseAuth.instance.currentUser!.email;
  final store = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Scaffold(
      appBar: CustomAppBar.customAppBar(
          context: context,
          leaading: InkWell(
              onTap: () {
                key.currentState!.openDrawer();
              },
              child: Icon(
                Icons.menu,
                size: 30,
                color: AppColor.blackColor,
              )),
          title: 'Home',
          actions: [
            IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.search,
                  size: 30,
                  color: AppColor.blackColor,
                ))
          ]),
      body: SingleChildScrollView(
        // controller: scrollController,
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              StreamBuilder(
                  stream: store.collection('app').doc(email).snapshots(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      final data = snapshot.data!.data();
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Hello',
                                style:
                                    Theme.of(context).textTheme.headlineSmall,
                              ),
                              Text(data!['userName'],
                                  style: Theme.of(context)
                                      .textTheme
                                      .headlineLarge),
                            ],
                          ),
                          Container(
                            height: size.height * 0.07,
                            width: size.height * 0.07,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                border: Border.all(
                                    width: 1, color: AppColor.backgroundColor),
                                image: data['image'] != null
                                    ? DecorationImage(
                                        image: NetworkImage(data['image']))
                                    : DecorationImage(
                                        image: NetworkImage(AppName.imageUrl),
                                        fit: BoxFit.cover)),
                          )
                        ],
                      );
                    }
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Hello',
                              style: Theme.of(context).textTheme.headlineSmall,
                            ),
                            Text('Md Jahid Hasan',
                                style:
                                    Theme.of(context).textTheme.headlineLarge),
                          ],
                        ),
                        Container(
                          height: size.height * 0.07,
                          width: size.height * 0.07,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              border: Border.all(
                                  width: 1, color: AppColor.backgroundColor),
                              image: DecorationImage(
                                  image: NetworkImage(AppName.imageUrl),
                                  fit: BoxFit.cover)),
                        )
                      ],
                    );
                  }),
              SizedBox(
                height: size.height * 0.02,
              ),
              StreamBuilder(
                  stream: store.collection('cetagory').snapshots(),
                  builder: (context, snapshot) {
                    if (!snapshot.hasData) {
                      return Center(
                          child: CircularProgressIndicator(
                        color: AppColor.backgroundColor,
                      ));
                    } else {
                      return CarouselSlider.builder(
                          itemCount: snapshot.data!.docs.length,
                          itemBuilder: (context, index, realIndex) {
                            final data = snapshot.data!.docs[index];
                            return ClipRRect(
                              borderRadius: BorderRadius.circular(30),
                              child: CachedNetworkImage(
                                height: 200,
                                imageUrl: data['imagePath'],
                                fit: BoxFit.cover,
                              ),
                            );
                          },
                          options: CarouselOptions(
                              autoPlay: true,
                              autoPlayCurve: Curves.easeInOut,
                              enlargeCenterPage: true));
                    }
                  }),
              SizedBox(
                height: size.height * 0.02,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Cetagory',
                    style: Theme.of(context).textTheme.headlineLarge,
                  ),
                  InkWell(
                    onTap: () {},
                    child: Text(
                      'See all',
                      style: Theme.of(context).textTheme.displaySmall,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: size.height * 0.001,
              ),
              SizedBox(
                height: size.height * 0.09,
                width: size.width,
                child: BlocBuilder<HomeBloc, HomeState>(
                  builder: (context, state) {
                    switch (state.categoryStatus) {
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
                        return ListView.builder(
                            scrollDirection: Axis.horizontal,
                            shrinkWrap: true,
                            itemCount: state.categoryList.length,
                            itemBuilder: (context, index) {
                              return CustomCategory(
                                imagePath: AppName.categoryImageUrlList[index],
                                onTap: () {
                                  AppName.push(
                                      context: context,
                                      object: Categorydetails(
                                          category: state.categoryList[index]));
                                },
                              );
                            });
                    }
                  },
                ),
              ),
              SizedBox(
                height: size.height * 0.02,
              ),
              Text(
                'Top Items',
                style: Theme.of(context).textTheme.headlineLarge,
              ),
              BlocBuilder<HomeBloc, HomeState>(
                builder: (context, state) {
                  switch (state.status) {
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
                      

                
                          return GridView.builder(
                              physics: const NeverScrollableScrollPhysics(),
                              // controller: scrollController,
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 2),
                              itemCount: state.productFinalList.length,
                              shrinkWrap: true,
                              // ignore: body_might_complete_normally_nullable
                              itemBuilder: (context, index) {
                                ProductModel item = state.productFinalList[index].model; 
                                if(state.productFinalList[index].isFavorite){

                             return CustomCart(
                                  imagePath: item.image!,
                                  productPrice: item.price.toString(),
                                  productname: item.title!,
                                  wishListButton: () {
                                    context
                                        .read<HomeBloc>()
                                        .add(AddRemovedWishList(model: state.productFinalList[index]));
                                  },
                                  favoriteIcon: Icons.favorite,
                                  offer: '10',
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
                                }else{

                             return CustomCart(
                                  imagePath: item.image!,
                                  productPrice: item.price.toString(),
                                  productname: item.title!,
                                  wishListButton: () {
                                     context
                                        .read<HomeBloc>()
                                        .add(AddRemovedWishList(model: state.productFinalList[index]));
                                  },
                                  favoriteIcon: Icons.favorite_outline,
                                  offer: '10',
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
                                }



                              
                                
                              });
                        

                     
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
