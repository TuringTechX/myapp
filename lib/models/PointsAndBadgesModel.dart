class PointsAndBadgesModel {
  int _totalPoints = 0;
  List<String> _badges = [];

  int get totalPoints => _totalPoints;
  List<String> get badges => _badges;

  void addPoints(int points) {
    _totalPoints += points;
  }

  void addBadge(String badge) {
    _badges.add(badge);
  }
}
