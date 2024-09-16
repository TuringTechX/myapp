class AgricultureModel {
  double _waterUsage = 0.0;
  double _soilHealth = 0.0;

  double get waterUsage => _waterUsage;
  double get soilHealth => _soilHealth;

  void updateWaterUsage(double water) {
    _waterUsage = water;
  }

  void updateSoilHealth(double soil) {
    _soilHealth = soil;
  }
}
