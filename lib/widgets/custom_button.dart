import 'package:flutter/material.dart';
import 'package:health_elev8_app/path_file.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final Function()? onTap;
  final Color? backgroundColor;
  final Color? borderColor;
  final double? radios, width, height;
  final double? fontSize;
  final EdgeInsetsGeometry? margin;
  final bool showArrow;
  final bool showSuffix;
  final Color? fontColor;

  const CustomButton({
    super.key,
    required this.text,
    this.onTap,
    this.backgroundColor,
    this.borderColor,
    this.radios,
    this.width,
    this.height,
    this.fontSize,
    this.margin,
    this.showArrow = false,
    this.showSuffix = false,
    this.fontColor,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width ?? MediaQuery.sizeOf(context).width,
        height: height ?? 52,
        margin: margin ?? const EdgeInsets.symmetric(horizontal: 04),
        decoration: BoxDecoration(
          color: backgroundColor ?? AppColors.blackColor,
          borderRadius: BorderRadius.circular(radios ?? 16),
          border: Border.all(color: borderColor ?? Colors.transparent),
        ),
        alignment: Alignment.center,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            showArrow
                ? Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: ImageHelper(
                      image: AppAssets.backIcon,
                      imageType: ImageType.asset,
                      height: 24,
                      width: 24,
                    ),
                  )
                : const SizedBox.shrink(),
            AppText(
              text: text,
              color: fontColor ?? AppColors.whiteColor,
              fontWeight: FontWeight.w600,
              fontSize: fontSize ?? 20,
            ),
            showSuffix
                ? const Padding(
                    padding: EdgeInsets.only(right: 8.0),
                    child: Icon(
                      Icons.arrow_forward_ios,
                      color: AppColors.whiteColor,
                      size: 15,
                    ),
                  )
                : const SizedBox.shrink(),
          ],
        ),
      ),
    );
  }
}
