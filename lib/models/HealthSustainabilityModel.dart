class HealthSustainabilityModel {
  String _recommendation = '';

  String get recommendation => _recommendation;

  Future<void> generateRecommendation() async {
    // Simulate fetching a health and sustainability recommendation
    _recommendation = 'Use eco-friendly products and exercise for 30 minutes daily';
    // In real case, it would fetch data from health metrics or AI recommendations
  }
}
