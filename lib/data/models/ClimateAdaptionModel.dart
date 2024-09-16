class ClimateAdaptationModel {
  final String region;
  final double adaptationScore;      // Score indicating level of climate adaptation
  final String mitigationPlan;
  final DateTime lastUpdated;

  ClimateAdaptationModel({
    required this.region,
    required this.adaptationScore,
    required this.mitigationPlan,
    required this.lastUpdated,
  });
}
