import 'package:flutter/material.dart';
import '../../models/HealthSustainabilityModel.dart';

class HealthSustainabilityController with ChangeNotifier {
  HealthSustainabilityModel _healthSustainabilityModel = HealthSustainabilityModel();

  String get recommendation => _healthSustainabilityModel.recommendation;

  Future<void> fetchHealthRecommendation() async {
    await _healthSustainabilityModel.generateRecommendation();
    notifyListeners();
  }
}
