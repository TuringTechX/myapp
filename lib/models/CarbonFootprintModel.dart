// lib/models/CarbonFootprintModel.dart
class CarbonFootprintModel {
  final double totalEmissions;
  final double transportEmissions;
  final double energyEmissions;
  final double wasteEmissions;
  final List<String> offsetProjects;

  CarbonFootprintModel({
    this.totalEmissions = 0.0,
    this.transportEmissions = 0.0,
    this.energyEmissions = 0.0,
    this.wasteEmissions = 0.0,
    this.offsetProjects = const [],
  });

  factory CarbonFootprintModel.fromJson(Map<String, dynamic> json) {
    return CarbonFootprintModel(
      totalEmissions: json['totalEmissions'] ?? 0.0,
      transportEmissions: json['transportEmissions'] ?? 0.0,
      energyEmissions: json['energyEmissions'] ?? 0.0,
      wasteEmissions: json['wasteEmissions'] ?? 0.0,
      offsetProjects: List<String>.from(json['offsetProjects'] ?? []),
    );
  }

  void addOffsetProject(String project) {
    offsetProjects.add(project);
  }
}
