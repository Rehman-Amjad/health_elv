import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:health_elev8_app/path_file.dart';
import 'package:image_picker/image_picker.dart';

class ProfileController extends BaseController {
  final formKey = GlobalKey<FormState>();

  final FirebaseStorage _storage = FirebaseStorage.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final ImagePicker _picker = ImagePicker();

  final nameTEC = TextEditingController();
  final emailTEC = TextEditingController();
  final phoneTEC = TextEditingController();
  final dobTEC = TextEditingController();
  final genderTEC = TextEditingController();
  DateTime dobDateTime = DateTime.now();

  final firebase = FirebaseAuth.instance;
  final authService = AuthService();
  UserData? userData;

  RxBool isLoading = false.obs;

  @override
  void onInit() {
    getProfileInfo();
    super.onInit();
  }

  getProfileInfo() async {
    isLoading.value = true;
    userData = await authService.getUserData();
    if (userData != null) {
      nameTEC.text = userData?.fullName ?? "--";
      emailTEC.text = userData?.email ?? "--";
      phoneTEC.text = userData?.phoneNumber ?? "--";
      genderTEC.text = userData?.gander ?? "--";
      dobTEC.text = userData?.dob ?? "--";
    }
    isLoading.value = false;
    update();
  }

  updateProfileInfo(context) async {
    AppUtils().showLoading(context);
    UserData userData = UserData(
      uid: firebase.currentUser?.uid,
      fullName: nameTEC.text.trim(),
      dob: dobTEC.text.trim(),
      phoneNumber: phoneTEC.text.trim(),
      email: emailTEC.text.trim(),
      gander: genderTEC.text.trim(),
    );

    await authService.updateUserData(userData).then((isUpdate) {
      if (isUpdate) {
        AppUtils().showToast(text: "Profile Updated Successfully.");
        getProfileInfo();
      }
    });
    AppUtils().dismissLoading();
    update();
  }

  // Pick image from gallery or camera
  Future<XFile?> pickImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery); // You can use ImageSource.camera too

    if (pickedFile != null) {
      return pickedFile;
    }
    return null;
  }

  // Upload image to Firebase Storage and get the download URL
  Future<String?> uploadImage(XFile imageFile, String userId) async {
    try {
      // Create a reference in Firebase Storage
       String fileExtension = imageFile.path.split('.').last;
      Reference storageRef = _storage.ref().child('userProfiles/$userId.$fileExtension');

      // Upload the file
      UploadTask uploadTask = storageRef.putFile(File(imageFile.path));
      await uploadTask;

      // Get the download URL
      String downloadURL = await storageRef.getDownloadURL();
      return downloadURL;
    } catch (e) {
      debugPrint("Error uploading image: $e");
      return null;
    }
  }

  // Update Firestore with the new profile image URL
  Future<void> updateUserProfileImage(String userId, String imageUrl) async {
    try {
      await _firestore
          .collection(Collection.user.name)
          .doc(userId)
          .update({
        'imageUrl': imageUrl,
      }).then((onValue){
        AppUtils().dismissLoading();
        getProfileInfo();
      });
    } catch (e) {
      debugPrint("Error updating Firestore: $e");
    }
  }

  Future<void> pickAndUpdateProfileImage(context) async {
    String uid=firebase.currentUser!.uid;
    XFile? imageFile = await pickImage();
    if (imageFile != null) {
      AppUtils().showLoading(context);
      String? downloadURL = await uploadImage(imageFile, uid);
      if (downloadURL != null) {
        await updateUserProfileImage(uid, downloadURL);
      }
    }
  }
}
