import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:health_elev8_app/path_file.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

class AppUtils {

  static linearDecoration({BorderRadiusGeometry? borderRadius}) =>
      BoxDecoration(
        borderRadius: borderRadius,
        gradient: LinearGradient(
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

 static loader() => Center(
        child: CircularProgressIndicator(
          color: AppColors.primaryColor,
        ),
      );

  showLoading(context) {
    return showDialog(
      barrierDismissible: true,
      context: context,
      builder: (dialogContext) {
        return Center(
          child: CircularProgressIndicator(
            color: AppColors.primaryColor,
          ),
        );
      },
    );
  }

  dismissLoading() {
    Get.back();
  }

  showToast({String? text, Color? bgColor, Color? txtColor}) {
    Fluttertoast.showToast(
      msg: text!,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 3,
      backgroundColor: bgColor ?? Colors.black45,
      textColor: txtColor ?? Colors.white,
      fontSize: 14.0,
    );
  }

  /// date formate
  String formatDateString(String dateString) {
    // Step 1: Parse the Date String into a DateTime object
    DateTime dateTime = DateTime.parse(dateString);

    // Step 2: Format the DateTime object into the desired format
    String formattedDate = DateFormat('dd MMMM yyyy - h a').format(dateTime);

    return formattedDate;
  }
}

tooDouble(String? value) {
  return double.parse(value ?? "0");
}
