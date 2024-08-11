
class BloodTestResults {
  final String currentRange;
  final String normalRange;
  final String status;
  final String subTitle;
  final String testDesc;
  final String testUnit;
  final String title;
  final String testDate;

  BloodTestResults({
    required this.currentRange,
    required this.normalRange,
    required this.status,
    required this.subTitle,
    required this.testDesc,
    required this.testUnit,
    required this.title,
    required this.testDate,
  });

  // Factory constructor to create an instance from a Firestore document snapshot
  factory BloodTestResults.fromFirestore(Map<String, dynamic> data) {
    return BloodTestResults(
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

  // Method to convert the instance back to a map for Firestore
  Map<String, dynamic> toFirestore() {
    return {
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
}