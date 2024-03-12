import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:online/custom_widget/custom_appbar.dart';
import 'package:online/custom_widget/custom_buttons.dart';
import 'package:online/model/cart_details_model.dart';
import 'package:online/utilsh/color.dart';
import 'package:persistent_shopping_cart/model/cart_model.dart';
import 'package:persistent_shopping_cart/persistent_shopping_cart.dart';

class CardDetails extends StatelessWidget {
  const CardDetails({super.key, required this.item});
  final CartDetailsModel item;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Scaffold(
      appBar: CustomAppBar.customAppBar(context: context),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                  child: CachedNetworkImage(
                imageUrl: item.imagePath,
              )),
              SizedBox(
                height: size.height * 0.02,
              ),
              Text(
                item.name,
                style: Theme.of(context).textTheme.displayMedium,
              ),
              SizedBox(
                height: size.height * 0.02,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '\$ ${item.price}',
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                  Text(
                    'Rating: ${item.rating}',
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                ],
              ),
              SizedBox(
                height: size.height * 0.02,
              ),
              Text(
                'Discription',
                style: Theme.of(context).textTheme.headlineLarge,
              ),
              SizedBox(
                height: size.height * 0.001,
              ),
              Text(
                item.discriprion,
                style: Theme.of(context).textTheme.labelSmall,
              ),
              SizedBox(
                height: size.height * 0.02,
              ),
              item.stock < 1
                  ? Text(
                      'Stock out',
                      style: Theme.of(context).textTheme.headlineSmall,
                    )
                  : Text(
                      'Avalable',
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Container(
          height: size.height * 0.11,
          width: size.width,
          color: AppColor.blackColor.withOpacity(.1),
          child: Column(
               
            children: [CustomButton(buttonName: 'Add to cart', onTap: () async{
              List<String> image = [item.imagePath];
                    await PersistentShoppingCart().addToCart(PersistentShoppingCartItem(
                       productId: item.id.toString(), 
                       productName: item.name, 
                       quantity: 1, 
                       unitPrice: double.parse(item.price), 
                       productImages: image, 
                       
                    ));
            })],
          ),
        ),
      ),
    );
  }
}
