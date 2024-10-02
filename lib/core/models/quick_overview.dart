
class QuickOverview {
  final String? docId;
  final String? overView;

  QuickOverview({
    this.docId,
    this.overView,
  });

  factory QuickOverview.fromFirestore(Map<String, dynamic> data) {
    return QuickOverview(
      docId: data['docId'] as String,
      overView: data['overView'] as String,
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      'docId': docId,
      'overView': overView,
    };
  }
}
