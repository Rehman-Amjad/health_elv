
class HealthTrends {
  final String? trendName;
  final String? score;
  final String? description;

  HealthTrends({
    this.trendName,
    this.score,
    this.description,
  });

  // Factory constructor to create an instance from a Firestore document snapshot
  factory HealthTrends.fromFirestore(Map<String, dynamic> data) {
    return HealthTrends(
      trendName: data['trendName'] as String,
      score: data['score'] as String,
      description: data['description'] as String,
    );
  }

  // Method to convert the instance back to a map for Firestore
  Map<String, dynamic> toFirestore() {
    return {
      'trendName': trendName,
      'score': score,
      'description': description,
    };
  }
}
