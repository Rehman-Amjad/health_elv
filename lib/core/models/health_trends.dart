
class HealthTrends {
  final String? trendName;
  final String? score;

  HealthTrends({
    this.trendName,
    this.score,
  });

  factory HealthTrends.fromFirestore(Map<String, dynamic> data) {
    return HealthTrends(
      trendName: data['trendName'] as String,
      score: data['score'] as String,
    );
  }
}
