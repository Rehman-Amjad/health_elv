import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:health_elev8_app/path_file.dart';
import 'package:sizer/sizer.dart';

import 'export.dart';

class FaqsView extends GetView<FaqsController> {
  const FaqsView({super.key});

  @override
  Widget build(BuildContext context) {
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
                itemCount: controller.stringList.length,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return ExpansionTile(
                    trailing: Icon(
                      controller.isExpand.isFalse
                          ? Icons.arrow_circle_down_rounded
                          : Icons.arrow_circle_up_rounded,
                      color: Colors.black38,
                    ),
                    title: Container(
                      padding: const EdgeInsets.all(8.0),
                      decoration: BoxDecoration(
                        color: Colors.black38,
                        // Background color for the question header
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      child: Text(
                        controller.stringList[index]['question']!,
                        style: GoogleFonts.poppins(
                          color: Colors.white,
                          // Text color for the question header
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: Text(controller.stringList[index]['answer']!),
                      )
                    ],
                    onExpansionChanged: (value) {
                      controller.isExpand.value = value;
                      controller.update();
                    },
                  );
                },
              ),
              const SizedBox(height: 10),
            ],
          ),
        );
      },
    );
  }
}
