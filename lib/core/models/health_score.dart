
class HealthScore {
  final String? uid;
  final String? score;
  final String? sleepTime;

  HealthScore({
    this.uid,
    this.score,
    this.sleepTime,
  });

  // Factory constructor to create an instance from a Firestore document snapshot
  factory HealthScore.fromFirestore(Map<String, dynamic> data) {
    return HealthScore(
      uid: data['uid'] as String,
      score: data['score'] as String,
      sleepTime: data['sleepTime'] as String,
    );
  }

  // Method to convert the instance back to a map for Firestore
  Map<String, dynamic> toFirestore() {
    return {
      'uid': uid,
      'score': score,
      'sleepTime': sleepTime,
    };
  }
}
