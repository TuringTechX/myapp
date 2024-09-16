class HealthcareModel {
  final String userId;
  final Map<String, dynamic> healthMetrics;
  final List<String> medicalConditions;
  final String healthcareProvider;

  HealthcareModel({
    required this.userId,
    required this.healthMetrics, // e.g. heart rate, BMI, blood pressure
    required this.medicalConditions,
    required this.healthcareProvider,
  });
}
