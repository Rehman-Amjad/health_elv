import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:health_elev8_app/path_file.dart';
import 'package:image_picker/image_picker.dart';

class AppUtils {

 static  linearDecoration({BorderRadiusGeometry? borderRadius}) =>  BoxDecoration(
    borderRadius:borderRadius,
    gradient:  LinearGradient(
      begin: Alignment.topRight,
      end: Alignment.bottomLeft,
      colors: [
        AppColors.primaryColor.withOpacity(0.90),
        AppColors.primaryColor.withOpacity(0.50),
      ],
    ),
  );

  static bool isEmail(email) {
    return RegExp(r'^.+@[a-zA-Z]+\.{1}[a-zA-Z]+(\.{0,1}[a-zA-Z]+)$')
        .hasMatch(email);
  }

  static Future<File?> pickImage() async {
    final ImagePicker imagePicker = ImagePicker();
    final pickedFile = await imagePicker.pickImage(source: ImageSource.gallery);
    return (pickedFile != null) ? File(pickedFile.path) : null;
  }

  static dynamic showLoading(context) {
    return showDialog(
      barrierDismissible: true,
      context: context,
      builder: (dialogContext) {
        return const Center(
          child: CircularProgressIndicator(
              // color: AppColors.primaryAppColor,
              ),
        );
      },
    );
  }

  static dismissLoading() {
    Get.back();
  }
  showToast(Color color, String msg) {
    Fluttertoast.showToast(
        msg: msg,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 3,
        backgroundColor: Colors.black45,
        textColor: Colors.white,
        fontSize: 14.0);
  }
}
