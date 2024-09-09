import 'package:flutter/material.dart';
import '../models/EnergyCreditModel.dart';

class EnergyTradingController with ChangeNotifier {
  EnergyCreditModel _energyCreditModel = EnergyCreditModel();

  List<String> get energyCredits => _energyCreditModel.energyCredits;
  double get totalCredits => _energyCreditModel.calculateTotalCredits();

  Future<void> tradeEnergy(String creditId) async {
    _energyCreditModel.tradeCredit(creditId);
    notifyListeners();
  }

  Future<void> addEnergyCredit(String creditId) async {
    _energyCreditModel.addCredit(creditId);
    notifyListeners();
  }
}
