class SustainabilityModel {
  final String goalId;
  final String userId;
  final String goalName;
  final double progress; // Progress percentage 0-100%
  final DateTime targetDate;

  SustainabilityModel({
    required this.goalId,
    required this.userId,
    required this.goalName,
    required this.progress,
    required this.targetDate,
  });
}
