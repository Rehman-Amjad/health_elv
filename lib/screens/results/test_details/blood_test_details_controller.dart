import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

import '../../../path_file.dart';

class BloodTestDetailsController extends BaseController {
  final _firestoreRef = FirebaseFirestore.instance;
  final _firebaseAuth = FirebaseAuth.instance;
  RxString selectedTab = 'Current'.obs;
  String testName = Get.arguments[0];
  BloodTestResults item = Get.arguments[1];

  List<BloodTestResults> comparisonList = [];
  RxBool isLoading=false.obs;

  @override
  void onInit() {
    if(testName=="BloodTest"){
      getPreviousTestResults();
    }else{
      getPreviousFlaggedTest();
    }

    super.onInit();
  }

  getPreviousTestResults() async {
    isLoading=true.obs;
    DateTime currentDate = DateTime.now();
    final snapShot = await _firestoreRef
        .collection(Collection.user.name)
        .doc(_firebaseAuth.currentUser!.uid)
        .collection(Collection.allBloodTestResults.name)
        .where('sub_title', isEqualTo: item.subTitle)
        .where('test_date', isLessThan: Timestamp.fromDate(currentDate))
        .get();

    for (var doc in snapShot.docs) {
      comparisonList.add(BloodTestResults.fromFirestore(doc.data()));
    }
    isLoading=false.obs;
    update();
  }

  getPreviousFlaggedTest() async {
    isLoading=true.obs;
    DateTime currentDate = DateTime.now();
    final snapShot = await _firestoreRef
        .collection(Collection.user.name)
        .doc(_firebaseAuth.currentUser!.uid)
        .collection(Collection.flaggedResult.name)
        .where('sub_title', isEqualTo: item.subTitle)
        .where('test_date', isLessThan: Timestamp.fromDate(currentDate))
        .get();

    for (var doc in snapShot.docs) {
      comparisonList.add(BloodTestResults.fromFirestore(doc.data()));
    }
    isLoading=false.obs;
    update();
  }
}
