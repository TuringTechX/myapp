class PointsAndBadgesModel {
  final String userId;
  final int points;
  final List<String> badges;
  final DateTime lastUpdated;

  PointsAndBadgesModel({
    required this.userId,
    required this.points,
    required this.badges,
    required this.lastUpdated,
  });
}
