
class BloodTestResults {
  final String? uid;
  final String? currentRange;
  final String? normalRange;
  final String? status;
  final String? subTitle;
  final String? testDesc;
  final String? testUnit;
  final String? title;
  final String? testDate;
  final String? highMeanDate;
  final String? lowMeanDate;

  BloodTestResults({
    this.uid,
    this.currentRange,
    this.normalRange,
    this.status,
    this.subTitle,
    this.testDesc,
    this.testUnit,
    this.title,
    this.testDate,
    this.highMeanDate,
    this.lowMeanDate,
  });

  // Factory constructor to create an instance from a Firestore document snapshot
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
      testDate: data['test_date'] as String,
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
      highMeanDate: data['high_desc'],
      lowMeanDate: data['low_desc'],
    );
  }

  // Method to convert the instance back to a map for Firestore
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
      'high_desc': highMeanDate,
      'low_desc': lowMeanDate,
    };
  }
}
