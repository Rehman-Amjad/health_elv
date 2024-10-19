import 'package:cloud_firestore/cloud_firestore.dart';


class BloodTestResults {
  final String? uid;
  final String? testType;
  final String? title;
  final String? subTitle;
  final String? currentRange;
  final String? minRange;
  final String? maxRange;
  final String? seekbarValue;
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
    this.minRange,
    this.maxRange,
    this.seekbarValue,
    this.status,
    this.testDesc,
    this.testUnit,
    this.testDate,
  });

  factory BloodTestResults.fromFirestore(Map<String, dynamic> data) {
    return BloodTestResults(
      uid: data['uid'] ?? "",
      currentRange: data['current_range'] as String,
      testType: data['testType'] as String,
      minRange: data['min_range'] as String,
      maxRange: data['max_range'] as String,
      seekbarValue: data['seek_bar_value'] as String,
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
      currentRange: data['current_range'] as String,
      testType: data['testType'] as String,
      minRange: data['min_range'] as String,
      maxRange: data['max_range'] as String,
      seekbarValue: data['seek_bar_value'] as String,
      status:data['status'],
      testUnit :data['test_unit'],
      title: data['title'],
      testDate : data['test_date'],
      testDesc: data['test_desc'],
    );
  }
}
