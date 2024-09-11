import 'package:flutter/material.dart';
import '../../models/PointsAndBadgesModel.dart';

class PointsAndBadgesController with ChangeNotifier {
  PointsAndBadgesModel _pointsAndBadgesModel = PointsAndBadgesModel();

  int get totalPoints => _pointsAndBadgesModel.totalPoints;
  List<String> get badges => _pointsAndBadgesModel.badges;

  void completeAction(String action) {
    _pointsAndBadgesModel.addPoints(10); // 10 points per sustainable action
    notifyListeners();
  }

  void earnBadge(String badge) {
    _pointsAndBadgesModel.addBadge(badge);
    notifyListeners();
  }
}
