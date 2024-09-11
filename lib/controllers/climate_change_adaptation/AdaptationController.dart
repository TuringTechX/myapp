import 'package:flutter/material.dart';
import '../../models/EnvironmentDataModel.dart';

class AdaptationController with ChangeNotifier {
  EnvironmentDataModel _environmentDataModel = EnvironmentDataModel();

  double get airQuality => _environmentDataModel.airQuality;
  double get temperature => _environmentDataModel.temperature;

  Future<void> fetchRealTimeData() async {
    await _environmentDataModel.updateEnvironmentData();
    notifyListeners();
  }
}
