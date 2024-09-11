class AIRecommendationService {
  Future<String> getRecommendation() async {
    // Simulate fetching recommendations
    await Future.delayed(Duration(seconds: 2));
    return "We recommend switching to renewable energy sources for your home to reduce your carbon footprint.";
  }
}
