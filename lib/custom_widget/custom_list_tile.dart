import 'package:flutter/material.dart';
import 'package:online/utilsh/color.dart';

class CustomListTile extends StatelessWidget {
  const CustomListTile(
      {super.key,
      required this.leading,
      required this.title,
      required this.onTap, 
      this.subTitle, 
      this.traling

      });

  final IconData leading;
  final String title;
  final VoidCallback onTap;
  final String? subTitle;
  final Widget? traling;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Column(
      children: [
        ListTile(
          onTap: onTap,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          tileColor: AppColor.backgroundColor.withOpacity(.1),
          title: Text(title, style: Theme.of(context).textTheme.headlineSmall!.copyWith(fontWeight: FontWeight.w900)),
          leading: Icon(
            leading,
            color: AppColor.backgroundColor,
            size: 30,
          ),
          trailing: 
          traling ??
          Icon(
            Icons.arrow_forward_ios,
            size: 16,
            color: AppColor.blackColor,
          ),
          subtitle: 
          subTitle ==null?null:
          Text(subTitle!, style: Theme.of(context).textTheme.displaySmall!.copyWith(fontSize: 16),),
        ),
        SizedBox(
          height: size.height * 0.02,
        )
      ],
    );
  }
}

class CustomListTile2 extends StatelessWidget {
  const CustomListTile2(
      {super.key,
      required this.leading,
      required this.onTap,
      required this.title,
      this.trailing, 
      
      
      });
  final String title;
  final IconData leading;
  final VoidCallback onTap; 
  final Widget? trailing; 
  
  
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Column(
      children: [
        InkWell(
          onTap: onTap,
          child: Container(
            height: size.height * 0.09,
            width: size.width,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: AppColor.backgroundColor.withOpacity(0.1),
            ),
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(
                        leading,
                        color: AppColor.backgroundColor,
                        size: 30,
                      ),
                    SizedBox(width: size.height * 0.02,),

                      Text(title,
                          style: Theme.of(context).textTheme.headlineSmall),
                         SizedBox(height: size.height*0.01,),
                    ],
                  ),
                  trailing ?? 
                  
                  Icon(
                    Icons.arrow_forward_ios,
                    size: 16,
                    color: AppColor.blackColor,
                  ),
                ],
              ),
            ),
          ),
        ),
        SizedBox(
          height: size.height * 0.02,
        )
      ],
    );
  }
}
