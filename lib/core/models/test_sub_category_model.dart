class TestSubCategoryModel {
  String docId;
  String name;
  String testCategory;
  String testType;

  // Named constructor
  TestSubCategoryModel({
    required this.docId,
    required this.name,
    required this.testCategory,
    required this.testType,
  });

  // fromMap method to create an instance from a Map
  factory TestSubCategoryModel.fromMap(Map<String, dynamic> map) {
    return TestSubCategoryModel(
      docId: map['docId'] ?? '',
      name: map['name'] ?? '',
      testCategory: map['testCategory'] ?? '',
      testType: map['testType'] ?? '',
    );
  }

  // toJson method to convert an instance to a Map
  Map<String, dynamic> toJson() {
    return {
      'docId': docId,
      'name': name,
      'testCategory': testCategory,
      'testType': testType,
    };
  }

  @override
  String toString() {
    return name;
  }
}
