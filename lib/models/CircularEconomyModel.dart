class CircularEconomyModel {
  double _recyclingRate = 0.0;
  double _wasteReduction = 0.0;

  double get recyclingRate => _recyclingRate;
  double get wasteReduction => _wasteReduction;

  void setRecyclingRate(double rate) {
    _recyclingRate = rate;
  }

  void reduceWaste(double amount) {
    _wasteReduction += amount;
  }
}
