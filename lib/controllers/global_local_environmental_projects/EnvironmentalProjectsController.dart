import 'package:flutter/material.dart';
import '../../models/EnvironmentalProjectModel.dart';

class EnvironmentalProjectsController with ChangeNotifier {
  EnvironmentalProjectModel _projectModel = EnvironmentalProjectModel();

  List<String> get activeProjects => _projectModel.activeProjects;

  void supportProject(String projectName) {
    _projectModel.supportProject(projectName);
    notifyListeners();
  }
}
