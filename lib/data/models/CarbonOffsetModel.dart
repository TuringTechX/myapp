class CarbonOffsetModel {
  final String offsetId;
  final String project;
  final double amountOffset;         // In metric tons
  final DateTime purchaseDate;

  CarbonOffsetModel({
    required this.offsetId,
    required this.project,
    required this.amountOffset,
    required this.purchaseDate,
  });
}
