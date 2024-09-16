class DataModel {
  final String dataType;
  final DateTime timestamp;
  final Map<String, dynamic> data;
  final String source;

  DataModel({
    required this.dataType, // e.g. "climate", "energy", "health"
    required this.timestamp,
    required this.data,
    required this.source, // Source of data (API or sensor)
  });
}
