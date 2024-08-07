import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

import '../../path_file.dart';

class AuthService with CacheManager {

  final firebaseAuth=FirebaseAuth.instance;
  final firebaseStore=FirebaseFirestore.instance;

  Future<void> signInWithEmailAndPassword({required UserData userData}) async {

    try {
      final userCredential =
      await firebaseAuth.createUserWithEmailAndPassword(
        email: userData.email!,
        password: userData.password!,
      );
      await firebaseStore
          .collection(Collection.user.name)
          .doc(userCredential.user?.uid)
          .set(userData.toMap());
      Get.offAll(
            () => const LoginScreen(),
        binding: AppBinding(),
      );
    } catch (e) {
      AppUtils().showToast(text: 'Error $e');
    }
  }

  Future<bool> isPhoneNoExists({context, phoneNumber}) async {
    bool exists = false;
    try {
      QuerySnapshot querySnapshot = await FirebaseFirestore.instance
          .collection(Collection.user.name)
          .where('phoneNumber', isEqualTo: phoneNumber)
          .get();
      if (querySnapshot.docs.isNotEmpty) {
        exists = true;
      }
    } catch (e) {
      AppUtils().showToast(
        text: "Error checking phone number: $e",
      );
    }

    return exists;
  }

}
