class EnvironmentalProjectModel {
  List<String> _activeProjects = ['Reforestation', 'Ocean Cleanup'];

  List<String> get activeProjects => _activeProjects;

  void supportProject(String projectName) {
    _activeProjects.add(projectName);
  }
}
