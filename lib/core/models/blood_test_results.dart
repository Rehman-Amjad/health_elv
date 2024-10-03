import 'package:cloud_firestore/cloud_firestore.dart';

class BloodTestResults {
  final String? uid;
  final String? testType;
  final String? title;
  final String? subTitle;
  final String? currentRange;
  final String? normalRange;
  final String? status;
  final String? testDesc;
  final String? testUnit;
  final Timestamp? testDate;

  BloodTestResults({
    this.uid,
    this.testType,
    this.title,
    this.subTitle,
    this.currentRange,
    this.normalRange,
    this.status,
    this.testDesc,
    this.testUnit,
    this.testDate,
  });

  factory BloodTestResults.fromFirestore(Map<String, dynamic> data) {
    return BloodTestResults(
      uid: data['uid'] ?? "",
      currentRange: data['current_range'] as String,
      normalRange: data['normal_range'] as String,
      status: data['status'] as String,
      subTitle: data['sub_title'] as String,
      testDesc: data['test_desc'] as String,
      testUnit: data['test_unit'] as String,
      title: data['title'] as String,
      testDate: data['test_date'] as Timestamp,
    );
  }

  factory BloodTestResults.fromFlaggedResult(Map<String, dynamic> data) {
    return BloodTestResults(
      uid: data['uid'],
      currentRange: data['current_range'],
      normalRange: data['normal_range'],
      status:data['status'],
      testUnit :data['test_unit'],
      title: data['title'],
      testDate : data['test_date'],
      testDesc: data['test_desc'],
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      'uid': uid,
      'current_range': currentRange,
      'normal_range': normalRange,
      'status': status,
      'sub_title': subTitle,
      'test_desc': testDesc,
      'test_unit': testUnit,
      'title': title,
      'test_date': testDate,
    };
  }

  Map<String, dynamic> toFlaggedResults() {
    return {
      'uid': uid,
      'current_range': currentRange,
      'normal_range': normalRange,
      'status': status,
      'test_unit': testUnit,
      'title': title,
      'test_date': testDate,
      'test_desc': testDesc,
    };
  }
}
