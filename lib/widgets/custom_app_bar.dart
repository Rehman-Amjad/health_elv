import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../path_file.dart';

class CustomAppBar extends StatelessWidget {
  final String title;
  final bool showArrow;
  final double marginTop;

  const CustomAppBar({
    super.key,
    this.title = "",
    this.showArrow = true,
    required this.marginTop,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.only(left: 10.0, top: marginTop),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            showArrow
                ? IconButton(
              onPressed: () => Get.back(),
              icon: ImageHelper(
                image: AppAssets.backIcon,
                imageType: ImageType.asset,
                height: 24,
                width: 24,
              ),
            ) : const SizedBox.shrink(),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AppText(
                    text: title,
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                    color: AppColors.blackColor,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
