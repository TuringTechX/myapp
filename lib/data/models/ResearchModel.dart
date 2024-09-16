class ResearchModel {
  final String researchId;
  final String researcher;
  final String topic;
  final String status;
  final List<String> collaborators;
  final DateTime startDate;

  ResearchModel({
    required this.researchId,
    required this.researcher,
    required this.topic,
    required this.status, // e.g. ongoing, completed
    required this.collaborators,
    required this.startDate,
  });
}
