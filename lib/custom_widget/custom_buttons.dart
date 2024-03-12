
import 'package:flutter/material.dart';
import 'package:online/utilsh/color.dart';

class CustomButton extends StatelessWidget {
  const CustomButton(
      {super.key,
      required this.buttonName,
      required this.onTap,
      this.loading = false});
  final bool loading;
  final String buttonName;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return InkWell(
      onTap: loading? null: onTap,
      child: Container(
        alignment: Alignment.center,
        height: size.height * 0.09,
        width: size.width,
        decoration: BoxDecoration(
          color: AppColor.backgroundColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: loading
            ? Center(
                child: CircularProgressIndicator(
                color: AppColor.whiteColor,
              ))
            : Text(
                buttonName,
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w800,
                    color: AppColor.whiteColor),
              ),
      ),
    );
  }
}
