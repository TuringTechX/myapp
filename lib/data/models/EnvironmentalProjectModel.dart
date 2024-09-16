class EnvironmentalProjectModel {
  final String projectId;
  final String projectName;
  final String projectType; // e.g., reforestation, clean energy
  final double fundingRaised;
  final DateTime startDate;

  EnvironmentalProjectModel({
    required this.projectId,
    required this.projectName,
    required this.projectType,
    required this.fundingRaised,
    required this.startDate,
  });
}
