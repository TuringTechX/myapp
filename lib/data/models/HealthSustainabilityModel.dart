class HealthSustainabilityModel {
  final String userId;
  final String healthMetric; // e.g. carbon reduction, daily steps
  final double progress; // Percentage progress towards goal
  final DateTime lastUpdated;

  HealthSustainabilityModel({
    required this.userId,
    required this.healthMetric,
    required this.progress,
    required this.lastUpdated,
  });
}
