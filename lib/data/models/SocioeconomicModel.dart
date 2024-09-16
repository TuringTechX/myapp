class SocioeconomicModel {
  final String indicatorName;
  final String country;
  final double value;
  final DateTime updatedAt;

  SocioeconomicModel({
    required this.indicatorName, // e.g. unemployment rate, income disparity
    required this.country,
    required this.value,
    required this.updatedAt,
  });
}
