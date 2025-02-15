import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../path_file.dart';

class FireStoreService {
  final _firestoreRef = FirebaseFirestore.instance;
  final _firebaseAuth = FirebaseAuth.instance;

  ///get all drop down category
  Future<Map<String, List<String>>> getBloodDropDownLists() async {
    Set<String> testTypes = {};
    Set<String> testCategories = {};
    Set<String> testSubCategories = {};

    QuerySnapshot<Map<String, dynamic>> querySnapshot = await _firestoreRef
        .collection(Collection.user.name)
        .doc(_firebaseAuth.currentUser!.uid)
        .collection(Collection.allBloodTestResults.name)
        .get();

    for (var doc in querySnapshot.docs) {
      var bloodTestResult = BloodTestResults.fromFirestore(doc.data());
      testTypes.add(bloodTestResult.testType??"");
      testCategories.add(bloodTestResult.title??"");
      testSubCategories.add(bloodTestResult.subTitle??"");
    }

    // Convert sets to lists and return them
    return {
      'testTypes': testTypes.toList(),
      'testCategories': testCategories.toList(),
      'testSubCategories': testSubCategories.toList(),
    };
  }

  Future<List<String>> getTestCategoryLists({testType}) async {
    Set<String> testCategories = {};

    QuerySnapshot<Map<String, dynamic>> querySnapshot = await _firestoreRef
        .collection(Collection.user.name)
        .doc(_firebaseAuth.currentUser!.uid)
        .collection(Collection.allBloodTestResults.name)
        .where('testType', isEqualTo: testType)
        .get();

    for (var doc in querySnapshot.docs) {
      var bloodTestResult = BloodTestResults.fromFirestore(doc.data());
      testCategories.add(bloodTestResult.title??"");
    }
    return testCategories.toList();
  }

  Future<List<String>> getTestSubCategoryLists({title}) async {
    Set<String> testSubCategories = {};

    QuerySnapshot<Map<String, dynamic>> querySnapshot = await _firestoreRef
        .collection(Collection.user.name)
        .doc(_firebaseAuth.currentUser!.uid)
        .collection(Collection.allBloodTestResults.name)
        .where('title', isEqualTo: title)
        .get();

    for (var doc in querySnapshot.docs) {
      var bloodTestResult = BloodTestResults.fromFirestore(doc.data());
      testSubCategories.add(bloodTestResult.subTitle??"");
    }
    return testSubCategories.toList();
  }


  Future<List<BloodTestResults>> getBloodTestResults(
      {required testSubCategory}) async {
    List<BloodTestResults> list = [];
    QuerySnapshot<Map<String, dynamic>> querySnapshot = await _firestoreRef
        .collection(Collection.user.name)
        .doc(_firebaseAuth.currentUser!.uid)
        .collection(Collection.allBloodTestResults.name)
        .where('sub_title', isEqualTo: testSubCategory)
        .get();
    for (var doc in querySnapshot.docs) {
      list.add(BloodTestResults.fromFirestore(doc.data()));
    }
    return list;
  }

  ///flagged results
  Future<List<BloodTestResults>> getFlaggedTestResults() async {
    List<BloodTestResults> list = [];

    final snapShot = await _firestoreRef
        .collection(Collection.user.name)
        .doc(_firebaseAuth.currentUser!.uid)
        .collection(Collection.flaggedResult.name)
        .get();

    for (var doc in snapShot.docs) {
      list.add(BloodTestResults.fromFirestore(doc.data()));
    }
    return list;
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

    final querySnapshot = await _firestoreRef
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
  Future<HealthTrends> getHealthTrendsList({
    required String trendCategory,
  }) async {

    final querySnapshot = await _firestoreRef
        .collection(Collection.user.name)
        .doc(_firebaseAuth.currentUser!.uid)
        .collection(Collection.healthTrends.name)
         .doc(trendCategory)
        .get();

    return HealthTrends.fromFirestore(querySnapshot.data() as Map<String, dynamic>);
  }

  ///Add Tests
  Future<List<TestTypeModel>> getTestTypes() async {
    final snapshot =
        await _firestoreRef.collection(Collection.testType.name).get();
    List<TestTypeModel> list = [];
    for (var doc in snapshot.docs) {
      list.add(TestTypeModel.fromMap(doc.data()));
    }
    return list;
  }

  ///testCategory
  Future<List<TestCategoryModel>> getTestCategory({testType}) async {
    Query query = _firestoreRef.collection(Collection.testCategory.name);

    if (testType.isNotEmpty) {
      query = query.where('testType', isEqualTo: testType);
    }

    final snapshot = await query.get();

    List<TestCategoryModel> list = [];
    for (var doc in snapshot.docs) {
      list.add(TestCategoryModel.fromMap(doc.data() as Map<String, dynamic>));
    }
    return list;
  }

  ///test-Sub-Category
  Future<List<TestSubCategoryModel>> getTestSubCategory({testCategory}) async {
    Query query = _firestoreRef.collection(Collection.testSubCategory.name);

    if (testCategory.isNotEmpty) {
      query = query.where('testCategory', isEqualTo: testCategory);
    }

    final snapshot = await query.get();

    List<TestSubCategoryModel> list = [];
    for (var doc in snapshot.docs) {
      list.add(
          TestSubCategoryModel.fromMap(doc.data() as Map<String, dynamic>));
    }
    return list;
  }

  ///
  Future<List<AdviceModel>> getAdviceList() async {
    List<AdviceModel> list = [];

    final querySnapshot = await _firestoreRef
        .collection(Collection.user.name)
        .doc(_firebaseAuth.currentUser!.uid)
        .collection(Collection.advices.name)
        .get();

    for (var doc in querySnapshot.docs) {
      list.add(AdviceModel.fromFirestore(doc.data()));
    }
    return list;
  }

  ///order new blood test
  Future<void> saveOrderBloodTest(OrderBloodTest orderBloodTest) async {
    final ref = _firestoreRef
        .collection(Collection.user.name)
        .doc(_firebaseAuth.currentUser!.uid)
        .collection(Collection.orderBloodTest.name)
        .doc();

    orderBloodTest.docId = ref.id;
    await ref.set(orderBloodTest.toFirestore());
  }

  Future<List<OrderBloodTest>> getAllOrderBloodTests({
    DateTime? filterDate,
  }) async {
    List<OrderBloodTest> filteredOrders = [];

    if (filterDate == null) {
      final snapshot = await _firestoreRef
          .collection(Collection.user.name)
          .doc(_firebaseAuth.currentUser!.uid)
          .collection(Collection.orderBloodTest.name)
          .get();
      for (var doc in snapshot.docs) {
        var testItem =
            OrderBloodTest.toJson(doc.data()); // Convert to your model
        filteredOrders.add(testItem);
      }
    } else {
      // Create DateTime objects for the start and end of the day
      DateTime startOfDay =
          DateTime(filterDate.year, filterDate.month, filterDate.day, 0, 0, 0);
      DateTime endOfDay = DateTime(
          filterDate.year, filterDate.month, filterDate.day, 23, 59, 59);

      // Convert DateTime to Timestamp for Firestore
      Timestamp startTimestamp = Timestamp.fromDate(startOfDay);
      Timestamp endTimestamp = Timestamp.fromDate(endOfDay);

      final snapshot = await _firestoreRef
          .collection(Collection.user.name)
          .doc(_firebaseAuth.currentUser!.uid)
          .collection(Collection.orderBloodTest.name)
          .where('testDate', isGreaterThanOrEqualTo: startTimestamp)
          .where('testDate', isLessThanOrEqualTo: endTimestamp)
          .get();

      for (var doc in snapshot.docs) {
        var testItem =
            OrderBloodTest.toJson(doc.data()); // Convert to your model
        filteredOrders.add(testItem);
      }
    }

    return filteredOrders;
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
