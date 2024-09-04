class AdviceModel {
  final String? uid;
  final String? title;
  final String? description;

  AdviceModel({
    this.uid,
    this.title,
    this.description,
  });

  // Factory constructor to create an instance from a Firestore document snapshot
  factory AdviceModel.fromFirestore(Map<String, dynamic> data) {
    return AdviceModel(
      uid: data['uid'] as String,
      title: data['title'] as String,
      description: data['description'] as String,
    );
  }

  // Method to convert the instance back to a map for Firestore
  Map<String, dynamic> toFirestore() {
    return {
      'uid': uid,
      'title': title,
      'description': description,
    };
  }
}
