class TestCategoryModel {
  String docId;
  String name;
  String testType;

  // Named constructor
  TestCategoryModel({
    required this.docId,
    required this.name,
    required this.testType,
  });

  // fromMap method to create an instance from a Map
  factory TestCategoryModel.fromMap(Map<String, dynamic> map) {
    return TestCategoryModel(
      docId: map['docId'] ?? '',
      name: map['name'] ?? '',
      testType: map['testType'] ?? '',
    );
  }

  @override
  String toString() {
    return name;
  }
}
