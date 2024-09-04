import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:health_elev8_app/core/models/health_score.dart';

import '../../path_file.dart';

class FireStoreService {
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

  ///get all drop down category
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

  Future<BloodTestResults?> getFlaggedData() async {
    try {
      // Reference to the document
      final ref = FirebaseFirestore.instance
          .collection(Collection.user.name)
          .doc(_firebaseAuth.currentUser!.uid)
          .collection(Collection.flaggedResult.name)
          .doc(Collection.result.name);

      // Get the document snapshot
      DocumentSnapshot snapshot = await ref.get();
      // Check if the document exists
      if (snapshot.exists) {
        return BloodTestResults.fromFlaggedResult(snapshot.data() as Map<String, dynamic>);
      } else {
        return null;
      }
    } catch (e) {
      debugPrint("Error getting document: $e");
    }
    return null;
  }

  ///
  Future<HealthScore?> getHealthScoreData() async {
    try {
      // Reference to the document
      final ref = FirebaseFirestore.instance
          .collection(Collection.user.name)
          .doc(_firebaseAuth.currentUser!.uid)
          .collection(Collection.userHealthScore.name)
          .doc(Collection.healthScore.name);

      // Get the document snapshot
      DocumentSnapshot snapshot = await ref.get();
      // Check if the document exists
      if (snapshot.exists) {
        return HealthScore.fromFirestore(snapshot.data() as Map<String, dynamic>);
      } else {
        return null;
      }
    } catch (e) {
      debugPrint("Error getting document: $e");
    }
    return null;
  }
}
