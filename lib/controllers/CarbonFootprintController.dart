import 'package:flutter/material.dart';
import '../models/CarbonFootprintModel.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';

class CarbonFootprintController with ChangeNotifier {
  CarbonFootprintModel _carbonFootprintModel = CarbonFootprintModel();

  double get carbonFootprint => _carbonFootprintModel.carbonFootprint;
  List<String> get offsetProjects => _carbonFootprintModel.offsetProjects;
  
  Future<void> calculateFootprint(double energyConsumption, double waste) async {
    try {
      _carbonFootprintModel.calculateCarbonFootprint(energyConsumption, waste);
      notifyListeners();
    } catch (e, stack) {
      await FirebaseCrashlytics.instance.recordError(e, stack);
    }
  }

  Future<void> participateInOffset(String project) async {
    try {
      _carbonFootprintModel.addOffsetProject(project);
      notifyListeners();
    } catch (e, stack) {
      await FirebaseCrashlytics.instance.recordError(e, stack);
    }
  }
}
