import 'package:flutter/material.dart';
import '../../models/CircularEconomyModel.dart';

class CircularEconomyController with ChangeNotifier {
  CircularEconomyModel _circularEconomyModel = CircularEconomyModel();

  double get recyclingRate => _circularEconomyModel.recyclingRate;
  double get wasteReduction => _circularEconomyModel.wasteReduction;

  void updateRecycling(double rate) {
    _circularEconomyModel.setRecyclingRate(rate);
    notifyListeners();
  }

  void reduceWaste(double amount) {
    _circularEconomyModel.reduceWaste(amount);
    notifyListeners();
  }
}
