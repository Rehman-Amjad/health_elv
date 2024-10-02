
class HealthScore {
  final String? uid;
  final String? score;
  final String? healthStatus;
  final String? statusDesc;

  HealthScore({
    this.uid,
    this.score,
    this.healthStatus,
    this.statusDesc,
  });

  factory HealthScore.fromFirestore(Map<String, dynamic> data) {
    return HealthScore(
      uid: data['uid'] as String,
      score: data['score'] as String,
      healthStatus: data['healthStatus'] as String,
      statusDesc: data['statusDesc'] as String,
    );
  }

}
