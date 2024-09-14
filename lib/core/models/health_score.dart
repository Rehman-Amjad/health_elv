
class HealthScore {
  final String? uid;
  final String? score;
  final String? healthStatus;
  final String? sleepTime;

  HealthScore({
    this.uid,
    this.score,
    this.healthStatus,
    this.sleepTime,
  });

  factory HealthScore.fromFirestore(Map<String, dynamic> data) {
    return HealthScore(
      uid: data['uid'] as String,
      score: data['score'] as String,
      healthStatus: data['healthStatus'] as String,
      sleepTime: data['sleepTime'] as String,
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      'uid': uid,
      'score': score,
      'healthStatus': healthStatus,
      'sleepTime': sleepTime,
    };
  }
}
