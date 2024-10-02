import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../path_file.dart';

class FireStoreService {
  final _firestoreRef = FirebaseFirestore.instance;
  final _firebaseAuth = FirebaseAuth.instance;

  ///get all drop down category
  Future<List<BloodTestResults>> getBloodTestResults(
      {DateTime? selectedDate}) async {
    List<BloodTestResults> list = [];
    QuerySnapshot<Map<String, dynamic>> querySnapshot;
    if (selectedDate == null) {
      querySnapshot = await _firestoreRef
          .collection(Collection.user.name)
          .doc(_firebaseAuth.currentUser!.uid)
          .collection(Collection.allBloodTestResults.name)
          .get();
      for (var doc in querySnapshot.docs) {
        list.add(BloodTestResults.fromFirestore(doc.data()));
      }
    } else {
      // Convert DateTime to the start of the day and end of the day for filtering
      DateTime startOfDay =
          DateTime(selectedDate.year, selectedDate.month, selectedDate.day);
      DateTime endOfDay =
          DateTime(selectedDate.year, selectedDate.month, selectedDate.day);

      Timestamp startTimestamp = Timestamp.fromDate(startOfDay);
      Timestamp endTimestamp = Timestamp.fromDate(endOfDay);

      print(startTimestamp);
      print(endTimestamp);

      querySnapshot = await _firestoreRef
          .collection(Collection.user.name)
          .doc(_firebaseAuth.currentUser!.uid)
          .collection(Collection.allBloodTestResults.name)
          .where('testDate', isGreaterThanOrEqualTo: startTimestamp)
          .where('testDate', isLessThanOrEqualTo: endTimestamp)
          .get();
      for (var doc in querySnapshot.docs) {
        list.add(BloodTestResults.fromFirestore(doc.data()));
      }
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
        return BloodTestResults.fromFlaggedResult(
            snapshot.data() as Map<String, dynamic>);
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
      final ref = _firestoreRef
          .collection(Collection.allHealthScore.name)
          .doc(_firebaseAuth.currentUser!.uid);

      // Get the document snapshot
      DocumentSnapshot snapshot = await ref.get();
      // Check if the document exists
      if (snapshot.exists) {
        return HealthScore.fromFirestore(
            snapshot.data() as Map<String, dynamic>);
      } else {
        return null;
      }
    } catch (e) {
      debugPrint("Error getting document: $e");
    }
    return null;
  }

  ///
  Future<List<QuickOverview>> getQuickOverViewList() async {
    List<QuickOverview> list = [];

    final querySnapshot =await _firestoreRef
        .collection(Collection.user.name)
        .doc(_firebaseAuth.currentUser!.uid)
        .collection(Collection.quickOverView.name)
        .get();

    for (var doc in querySnapshot.docs) {
      list.add(QuickOverview.fromFirestore(doc.data()));
    }
    return list;
  }

  ///
  Future<List<HealthTrends>> getHealthTrendsList() async {
    List<HealthTrends> list = [];

    final querySnapshot =
        await _firestoreRef.collection(Collection.healthTrends.name).get();

    for (var doc in querySnapshot.docs) {
      list.add(HealthTrends.fromFirestore(doc.data()));
    }
    return list;
  }

  ///
  Future<List<AdviceModel>> getAdviceList() async {
    List<AdviceModel> list = [];

    final querySnapshot = await _firestoreRef
        .collection(Collection.user.name)
        .doc(_firebaseAuth.currentUser!.uid)
        .collection(Collection.userAdvices.name)
        .get();

    for (var doc in querySnapshot.docs) {
      list.add(AdviceModel.fromFirestore(doc.data()));
    }
    return list;
  }

  ///order new blood test
  Future<void> saveOrderBloodTest(OrderBloodTest orderBloodTest) async {
    final ref = _firestoreRef
        .collection(Collection.orderBloodTest.name)
        .doc(); // Generates a unique ID for each test

    await ref.set(orderBloodTest.toFirestore());
  }

  ///get all faqs
  Future<List<Map<String, dynamic>>> getAllFaqs() async {
    final snapshot = await _firestoreRef.collection(Collection.faqs.name).get();

    List<Map<String, dynamic>> faqsList = [];
    for (var doc in snapshot.docs) {
      faqsList.add(doc.data());
    }

    return faqsList;
  }
}
