class CarbonFootprintModel {
  double _carbonFootprint = 0.0;
  List<String> _offsetProjects = [];

  double get carbonFootprint => _carbonFootprint;
  List<String> get offsetProjects => _offsetProjects;

  void calculateCarbonFootprint(double energyConsumption, double waste) {
    _carbonFootprint = (energyConsumption * 0.5) + (waste * 0.3); // Example formula
  }

  void addOffsetProject(String project) {
    _offsetProjects.add(project);
  }
}
