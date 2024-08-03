import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:health_elev8_app/screens/order_new_test/export.dart';

class AddNewTestView extends GetView<AddNewTestController> {
  const AddNewTestView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AddNewTestController>(
      initState: (_){
        Get.put(AddNewTestController());
      },
      builder: (_) {
        return const Placeholder();
      }
    );
  }
}
