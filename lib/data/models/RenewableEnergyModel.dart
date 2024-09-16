class RenewableEnergyModel {
  final String userId;
  final String energySource;         // e.g. solar, wind
  final double energyGenerated;      // In kWh
  final DateTime recordedAt;

  RenewableEnergyModel({
    required this.userId,
    required this.energySource,
    required this.energyGenerated,
    required this.recordedAt,
  });
}
