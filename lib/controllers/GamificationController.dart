import 'package:flutter/material.dart';
import '../models/RewardModel.dart';

class GamificationController with ChangeNotifier {
  RewardModel _rewardModel = RewardModel();

  int get totalPoints => _rewardModel.totalPoints;
  List<String> get rewards => _rewardModel.rewards;

  void completeAction(String action) {
    _rewardModel.addPoints(10); // Example: 10 points per action
    notifyListeners();
  }

  void redeemReward(String reward) {
    _rewardModel.redeemReward(reward);
    notifyListeners();
  }
}
