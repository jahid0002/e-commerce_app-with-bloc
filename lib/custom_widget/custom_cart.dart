import 'package:flutter/material.dart';
import 'package:online/utilsh/color.dart';

class CustomCart extends StatelessWidget {
  const CustomCart(
      {super.key,
      required this.imagePath,
      required this.productPrice,
      required this.productname,
      required this.favoriteIcon,
      required this.offer,
      required this.wishListButton, 
      required this.onTap
      });
  final String imagePath;
  final String productname;
  final String productPrice;
  final String offer;
  final VoidCallback wishListButton;
  final IconData favoriteIcon;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Card(
      surfaceTintColor: AppColor.whiteColor,
      color: AppColor.whiteColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)), 
      elevation: 5,
      child: InkWell( 
        onTap: onTap,
        child: Container(
         // margin: const EdgeInsets.all(5),
          height: size.height * 0.18,
          width: size.height * 0.10,
          decoration: BoxDecoration(
            //  color: AppColor.blackColor.withOpacity(0.1),
              borderRadius: BorderRadius.circular(10),
              border: Border.all(width: 1, color: AppColor.backgroundColor)),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Expanded(
                    flex: 2,
                    child: Stack(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            image: DecorationImage(
                                image: NetworkImage(
                                  imagePath,
                                ),
                                fit: BoxFit.contain),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                  color: AppColor.blackColor.withOpacity(.2),
                                  borderRadius: BorderRadius.circular(5)),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  '${offer}% OFF',
                                  style: Theme.of(context)
                                      .textTheme
                                      .labelSmall!
                                      .copyWith(fontSize: 12),
                                ),
                              ),
                            ),
                            IconButton(
                                onPressed: wishListButton,
                                icon: Icon(
                                  favoriteIcon,
                                  size: 22,
                                  color: AppColor.errorColor,
                                ))
                          ],
                        ),
                      ],
                    )),
                Expanded(
                    flex: 1,
                    child: Container( 
             //         color: AppColor.backgroundColor.withOpacity(.1),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            productname,
                            style: Theme.of(context)
                                .textTheme
                                .displaySmall!
                                .copyWith(overflow: TextOverflow.ellipsis),
                          ),
                          Text('\$ ${productPrice}',
                              style: Theme.of(context).textTheme.headlineSmall)
                        ],
                      ),
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
