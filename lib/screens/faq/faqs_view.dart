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
                    return _faqsItem(index);
                  }),
              const SizedBox(height: 10),
            ],
          ),
        );
      },
    );
  }

  _faqsItem(int index) {
    Map<String, dynamic> title = controller.stringList[index];
    return GestureDetector(
      onTap: () {},
      child: Container(
        width: Get.width,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(15)),
        ),
        child: Card(
          elevation: 2,
          child: Padding(
            padding: const EdgeInsets.all(14.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppText(
                  text: '${title['question']} ?',
                  fontSize: 15,
                  textAlign: TextAlign.left,
                  fontWeight: FontWeight.w700,
                ),
                const SizedBox(height: 10),
                CustomFormField(
                  tec: TextEditingController(text: '${title['answer']}'),
                  readOnly: true,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
