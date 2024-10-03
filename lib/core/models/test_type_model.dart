
class TestTypeModel{
  String docId;
  String name;

  // Named constructor
  TestTypeModel({required this.docId, required this.name});

  // fromMap method to create an instance from a Map
  factory TestTypeModel.fromMap(Map<String, dynamic> map) {
    return TestTypeModel(
      docId: map['docId'] ?? '',
      name: map['name'] ?? '',
    );
  }

  @override
  String toString() {
    return name;
  }


}