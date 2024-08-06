import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:health_elev8_app/path_file.dart';
import 'package:sizer/sizer.dart';

import 'export.dart';

class FaqsView extends GetView<FaqsController> {
  const FaqsView({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.sizeOf(context);
    return GetBuilder<FaqsController>(
      initState: (_) {
        Get.put(FaqsController());
      },
      builder: (_) {
        return Scaffold(
          appBar: const PreferredSize(
            preferredSize: Size(double.infinity, 60),
            child: CustomAppBar(
              title: "FAQs",
              marginTop: 20,
            ),
          ),
          body: ListView(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            children: [
              SizedBox(height: 02.h),
              ListView.builder(
                  shrinkWrap: true,
                  itemCount: controller.stringList.length,
                  itemBuilder: (context, int index) {
                    return _faqsItem(
                      title: controller.stringList[index],
                    );
                  }),
              const SizedBox(
                height: 10,
              ),
              CustomButton(
                margin: const EdgeInsets.symmetric(horizontal: 70),
                isGradient: true,
                text: 'Submit Now',
                onTap: () {
                  Get.back();
                },
                backgroundColor: AppColors.blackColor,
              )
            ],
          ),
        );
      },
    );
  }

  _faqsItem({title}) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        width: Get.width,
        height: Get.height * 0.1,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(15)),
        ),
        child: Card(
          elevation: 2,
          child: Padding(
            padding: const EdgeInsets.all(14.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppText(
                  text:
                      title ?? 'How personal are\nHealth Elevate supplements?',
                  fontSize: 15,
                  textAlign: TextAlign.left,
                  fontWeight: FontWeight.w700,
                ),
                Container(
                  height: 30,
                  width: 30,
                  decoration: AppUtils.linearDecoration(
                      borderRadius: const BorderRadius.all(
                    Radius.circular(05),
                  )),
                  alignment: Alignment.center,
                  child: const Icon(
                    Icons.add,
                    color: AppColors.whiteColor,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
