import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../path_file.dart';

class AuthService with CacheManager {

  final firebaseAuth=FirebaseAuth.instance;

  Future<bool> signInWithEmailAndPassword({context, email, password}) async {
    bool isUserFound = false;
    try {
      QuerySnapshot querySnapshot = await FirebaseFirestore.instance
          .collection(Collection.user.name)
          .where('email', isEqualTo: email)
          .where('password', isEqualTo: password)
          .get();

      if (querySnapshot.docs.isNotEmpty) {
        saveString(SharePrefKeys.uidKey,querySnapshot.docs.first.id);
        isUserFound = true;
      }
    } catch (e) {
      AppUtils().showToast(text: "Error signing in: $e");
    }
    return isUserFound;
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
