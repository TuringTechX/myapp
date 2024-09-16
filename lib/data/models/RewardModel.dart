class RewardModel {
  int _totalPoints = 0;
  List<String> _rewards = ['Tree Planting', 'Water Conservation'];

  int get totalPoints => _totalPoints;
  List<String> get rewards => _rewards;

  void addPoints(int points) {
    _totalPoints += points;
  }

  void redeemReward(String reward) {
    _rewards.remove(reward);
  }
}
