import 'package:flutter/material.dart';
import '../models/AgricultureModel.dart';

class AgricultureController with ChangeNotifier {
  AgricultureModel _agricultureModel = AgricultureModel();

  double get waterUsage => _agricultureModel.waterUsage;
  double get soilHealth => _agricultureModel.soilHealth;

  Future<void> updateMetrics(double water, double soil) async {
    _agricultureModel.updateWaterUsage(water);
    _agricultureModel.updateSoilHealth(soil);
    notifyListeners();
  }
}
