
class HealthTrends {
  final String? score;
  final String? description;

  HealthTrends({
    this.score,
    this.description,
  });

  factory HealthTrends.fromFirestore(Map<String, dynamic> data) {
    return HealthTrends(
      score: data['score'] as String,
      description: data['description'] as String,
    );
  }
}
