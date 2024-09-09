import 'package:flutter/material.dart';
import '../models/BiodiversityModel.dart';

class BiodiversityController with ChangeNotifier {
  BiodiversityModel _biodiversityModel = BiodiversityModel();

  List<String> get conservationActions => _biodiversityModel.conservationActions;
  int get protectedAreaCount => _biodiversityModel.protectedAreaCount;

  void contributeToBiodiversity(String action) {
    _biodiversityModel.addConservationAction(action);
    notifyListeners();
  }

  void protectNewArea() {
    _biodiversityModel.protectNewArea();
    notifyListeners();
  }
}
