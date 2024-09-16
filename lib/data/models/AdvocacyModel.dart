class AdvocacyModel {
  final String petitionId;
  final String title;
  final String description;
  final int signatures;
  final DateTime createdAt;

  AdvocacyModel({
    required this.petitionId,
    required this.title,
    required this.description,
    required this.signatures,
    required this.createdAt,
  });
}
