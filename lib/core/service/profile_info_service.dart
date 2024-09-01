import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../path_file.dart';

class ProfileInfoService {
  final _firestoreRef = FirebaseFirestore.instance;
  final _firebaseAuth = FirebaseAuth.instance;

  Future<UserData?> getUserData(uid) async {
    try {
      final res =
          await _firestoreRef.collection(Collection.user.name).doc(uid).get();

      return UserData.fromMap(res.data()!);
    } on FirebaseException catch (e) {
      log(e.message.toString());
      return null;
    }
  }

  //get all drop down category
  Future<List<BloodTestResults>> getBloodTestResults() async {
    List<BloodTestResults> list = [];

    final querySnapshot = await _firestoreRef
        .collection(Collection.bloodTestResults.name)
        .doc(_firebaseAuth.currentUser!.uid)
        .collection(Collection.tests.name)
        .get();

    for (var doc in querySnapshot.docs) {
      list.add(BloodTestResults.fromFirestore(doc.data()));
    }
    return list;
  }
}
