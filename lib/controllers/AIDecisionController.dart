import 'package:flutter/material.dart';
import '../models/AIDecisionModel.dart';

class AIDecisionController with ChangeNotifier {
  AIDecisionModel _aiDecisionModel = AIDecisionModel();

  String get recommendation => _aiDecisionModel.recommendation;

  Future<void> getSustainabilityRecommendation(String inputData) async {
    await _aiDecisionModel.analyzeData(inputData);
    notifyListeners();
  }
}
