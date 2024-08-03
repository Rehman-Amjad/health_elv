import 'package:flutter/material.dart';
import 'package:health_elev8_app/path_file.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final Function()? onTap;
  final Color? backgroundColor;
  final double? radios, width , height;
  final double? fontSize;
  final EdgeInsetsGeometry? margin;

  const CustomButton({
    super.key,
    required this.text,
     this.onTap,
    this.backgroundColor = AppColors.blackColor,
    this.radios,
    this.width,
    this.height,
    this.fontSize,
    this.margin,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width ?? MediaQuery.sizeOf(context).width,
        height: height?? 52,
        margin:margin?? const EdgeInsets.symmetric(horizontal: 04),
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(radios ?? 16),
          // border: Border.all(color: AppColors.blackColor),
        ),
        alignment: Alignment.center,
        child: AppText(
          text: text,
          color: AppColors.whiteColor,
          fontWeight: FontWeight.w600,
          fontSize: fontSize??20,
        ),
      ),
    );
  }
}
