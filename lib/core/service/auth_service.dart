import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../path_file.dart';

class AuthService with CacheManager {
  final _firestoreRef = FirebaseFirestore.instance;
  final _firebaseAuth = FirebaseAuth.instance;

  Future<void> signInWithEmailAndPassword({required UserData userData}) async {
    try {
      await _firebaseAuth
          .createUserWithEmailAndPassword(
        email: userData.email!,
        password: userData.password!,
      )
          .then((userCredential) async {
        userData.uid = userCredential.user?.uid;

        await _firestoreRef
            .collection(Collection.user.name)
            .doc(userCredential.user?.uid)
            .set(userData.toMap());

        Get.offAll(
          () => const LoginScreen(),
          binding: AppBinding(),
        );
      });
    } catch (e) {
      AppUtils().showToast(text: 'Error $e');
    }
  }

  /// user information
  Future<UserData?> getUserData() async {
    try {
      final res = await _firestoreRef
          .collection(Collection.user.name)
          .doc(_firebaseAuth.currentUser?.uid)
          .get();

      return UserData.fromMap(res.data()!);
    } on FirebaseException catch (e) {
      debugPrint(e.message.toString());
      return null;
    }
  }

  Future<bool> updateUserData(UserData userData) async {
    try {
      await _firestoreRef
          .collection(Collection.user.name)
          .doc(_firebaseAuth.currentUser?.uid)
          .update(userData.updateUser());
      return true;
    } on FirebaseException catch (e) {
      debugPrint(e.message.toString());
      return false; // Update failed
    }
  }
}
